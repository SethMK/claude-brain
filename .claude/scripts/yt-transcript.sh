#!/usr/bin/env bash
# yt-transcript.sh <youtube-url> <output-base>
#
# Tries YouTube captions via yt-dlp first; falls back to whisper.cpp
# transcription on downloaded audio. Emits <output-base>.transcript.txt
# and prints "captions" or "whisper" to stdout so the caller can log
# which path won.
#
# Requires (one-time): brew install yt-dlp whisper-cpp
# Requires (one-time): a whisper.cpp model at $WHISPER_MODEL
#   (default: $HOME/.whisper-models/ggml-large-v3-turbo.bin)
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "usage: yt-transcript.sh <youtube-url> <output-base>" >&2
  exit 64
fi

URL="$1"
OUT="$2"
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

MODEL="${WHISPER_MODEL:-$HOME/.whisper-models/ggml-large-v3-turbo.bin}"

# Path 1: captions (manual or auto, en/pl/original)
yt-dlp --skip-download \
       --write-subs --write-auto-subs \
       --sub-langs 'en.*,pl.*,orig.*' \
       --sub-format vtt --convert-subs vtt \
       -o "$TMPDIR/sub" "$URL" >/dev/null 2>&1 || true

VTT=$(find "$TMPDIR" -name '*.vtt' | head -1 || true)
if [ -n "$VTT" ]; then
  awk '
    /^WEBVTT/ || /^[0-9][0-9]:[0-9][0-9]/ || /^[[:space:]]*$/ || /^NOTE/ {next}
    {gsub(/<[^>]*>/,""); sub(/^[[:space:]]+/,""); sub(/[[:space:]]+$/,""); if ($0 != prev) print; prev=$0}
  ' "$VTT" > "${OUT}.transcript.txt"
  echo "captions"
  exit 0
fi

# Path 2: whisper.cpp on downloaded audio
if [ ! -f "$MODEL" ]; then
  echo "whisper model not found at: $MODEL" >&2
  echo "set WHISPER_MODEL or download per docs in .claude/scripts/yt-transcript.sh header" >&2
  exit 65
fi

yt-dlp -x --audio-format mp3 -o "$TMPDIR/audio.%(ext)s" "$URL" >/dev/null 2>&1
whisper-cli -m "$MODEL" -f "$TMPDIR/audio.mp3" \
            -otxt -of "${OUT}.transcript" -l auto >/dev/null 2>&1
echo "whisper"
