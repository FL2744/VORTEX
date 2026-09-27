#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
ARCH="${ARCH:-$(uname -m)}"
VERSION="${VERSION:-0.1.0}"
APP="dist/VORTEX.app"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
swiftc -parse-as-library -O -target "$ARCH-apple-macosx13.0" macos/VORTEX.swift -o "$APP/Contents/MacOS/VORTEX"
cat > "$APP/Contents/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>VORTEX</string>
<key>CFBundleIdentifier</key><string>edu.fl2744.vortex</string>
<key>CFBundleName</key><string>VORTEX</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>$VERSION</string>
<key>CFBundleVersion</key><string>$VERSION</string>
<key>LSMinimumSystemVersion</key><string>13.0</string>
<key>NSHighResolutionCapable</key><true/>
</dict></plist>
PLIST
codesign --force --sign - "$APP"
codesign --verify --strict "$APP"
ditto -c -k --sequesterRsrc --keepParent "$APP" "dist/VORTEX-macOS-$ARCH.zip"
shasum -a 256 "dist/VORTEX-macOS-$ARCH.zip" > "dist/VORTEX-macOS-$ARCH.zip.sha256"
