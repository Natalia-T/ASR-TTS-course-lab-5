#!/usr/bin/env bash

set -uo pipefail

if [ ! -d venv ]; then
  python3 -m venv venv || exit 1
fi

source venv/bin/activate || exit 1

pip install -U pip || exit 1

pip install -r requirements.txt || exit 1

git clone https://github.com/speechbrain/speechbrain.git || exit 1

cd speechbrain

pip install -e . || exit 1

pip install -r recipes/LJSpeech/TTS/extra_requirements.txt || exit 1

wget -c https://data.keithito.com/data/speech/LJSpeech-1.1.tar.bz2 || exit 1

if [ ! -d LJSpeech-1.1 ]; then
    tar -xf LJSpeech-1.1.tar.bz2  || exit 1
fi

echo Done
