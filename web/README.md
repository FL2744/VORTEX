# VORTEX browser page

Upload these three files into the same `public_html` directory:

- VORTEX.html
- vortex-icon.png
- vortex.ico

Open https://l1001.vt.domains/VORTEX.html (capitalization matters).

The page preserves ARC Chat’s layout, resizable results, text exports, and optional JupyterLite/code sections. Choose audio selects a local recording for direct upload to OpenAI when Translate audio is pressed. Whisper transcribes it and GPT-5.6 Luna translates it. No Python file path is needed. The selected audio is not uploaded into the optional JupyterLite workspace, and the OpenAI key is not passed to its bridge.

Requires an OpenAI API key, API billing, and an audio file under 25 MB. The audio and transcript leave the computer for OpenAI processing. The page does not store the key in browser storage. Serve over HTTPS. Network/CORS restrictions can prevent API calls. The optional JupyterLite bridge currently allows l1001.vt.domains and its own GitHub Pages origin.

JavaScript syntax and the main workflow were checked with mocked API responses; no live browser API call was made during this change.
