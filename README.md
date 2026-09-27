# VORTEX: VOice Recognition to Text EXtractor

A simple Python command-line program that turns recorded speech into translated text. Users choose the input language (or automatic detection), choose an output language, and enter their own OpenAI API key.

## How it works

1. OpenAI Whisper (`whisper-1`) transcribes the recording.
2. `gpt-4.1-mini` translates the transcript into the requested language.
3. VORTEX prints the result and saves a UTF-8 `.txt` file beside the recording.

Whisper's audio translation endpoint only produces English. VORTEX uses a separate text translation step to offer other output languages.

## Requirements

- Python 3.10 or newer and an internet connection.
- An OpenAI API key with access to the models and available API billing/credits. An ARC key is not interchangeable with an OpenAI key.
- An audio file smaller than 25 MB in MP3, MP4, MPEG, MPGA, M4A, WAV, or WebM format.

## Install

On macOS or Linux:

```bash
git clone https://github.com/FL2744/VORTEX.git
cd VORTEX
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
```

On Windows PowerShell, create the environment with `py -m venv .venv`, then use `.venv\Scripts\python.exe` instead of `.venv/bin/python` below.

## Run

```bash
.venv/bin/python audio_translate.py
```

At the prompts:

- **Audio file path:** enter `cairo-sample.mp3` to try the included recording, or a path to your own file.
- **Input language:** enter a two-letter code such as `ar`, `en`, `es`, or `fr`. Press Enter to let Whisper detect it.
- **Output language:** enter a language name, such as `English` or `Arabic`.
- **API key:** paste your OpenAI API key. Characters do not appear while typing.

For the included recording, the first result is saved as `cairo-sample-translated.txt`. Subsequent runs add a number rather than overwrite earlier results. Translation accuracy depends on recording quality, speech, and language; review the text before using it.

## Privacy and costs

Audio is uploaded to OpenAI for transcription, and the transcript is sent to OpenAI for translation. Processing is not offline or hosted by Virginia Tech. Both API steps may incur charges. The program does not deliberately write the API key to disk. Text responses use `store=False`; this is not a claim of zero provider retention. See OpenAI's data policies for service-side handling.

The virtual environment, secrets, and generated translations are excluded from Git. The included audio sample is intentionally part of this repository.

## Files

- `audio_translate.py`: interactive program.
- `cairo-sample.mp3`: sample recording.
- `requirements.txt`: Python dependency.

## Documentation

- [OpenAI speech-to-text](https://developers.openai.com/api/docs/guides/speech-to-text)
- [OpenAI API data controls](https://developers.openai.com/api/docs/guides/your-data)

## Validation

Python syntax and dependency import were checked. A live API call is not part of the repository setup checks.
