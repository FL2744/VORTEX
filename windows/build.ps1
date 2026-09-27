$ErrorActionPreference = 'Stop'
Set-Location "$PSScriptRoot/.."
python -m PyInstaller --noconfirm --clean --onefile --windowed --name VORTEX --icon assets/vortex.ico --add-data "assets/vortex.ico;assets" --collect-all openai windows/vortex.py
if ($LASTEXITCODE -ne 0) { throw 'Executable build failed' }
$process = Start-Process -FilePath dist/VORTEX.exe -ArgumentList '--smoke-test' -PassThru
if (-not $process.WaitForExit(60000)) { $process.Kill(); throw 'App launch timed out' }
if ($process.ExitCode -ne 0) { throw "App launch failed: $($process.ExitCode)" }
Compress-Archive -Path dist/VORTEX.exe -DestinationPath dist/VORTEX-Windows-x64.zip -Force
$hash = (Get-FileHash dist/VORTEX-Windows-x64.zip -Algorithm SHA256).Hash.ToLower()
"$hash  VORTEX-Windows-x64.zip" | Set-Content dist/VORTEX-Windows-x64.zip.sha256
