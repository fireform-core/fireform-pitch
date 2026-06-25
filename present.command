#!/usr/bin/env bash
# Present the FireForm pitch over local http.
#
# Why this exists: the last slide embeds the real FireForm frontend so you can
# demo it live. The product records audio via the microphone (getUserMedia) and
# sends it to Whisper for transcription. Browsers BLOCK microphone access for a
# cross-origin iframe when the parent page is opened as a file:// URL, so if you
# just double-click fireform-story.html, transcription silently fails.
#
# Serving the deck over http://localhost fixes that. Double-click this file
# (Finder) or run ./present.command. Ctrl+C to stop the server.
#
# Ports in play (so this picks a non-conflicting one): backend :8000,
# whisper :9000, frontend :5173, ollama :11434.

set -e
cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 not found. Install it (e.g. 'xcode-select --install') or serve this folder over http another way." >&2
  exit 1
fi

# Pick the first free port from the list.
PORT=""
for P in 8080 8181 8282 4321 7000; do
  if ! lsof -iTCP:"$P" -sTCP:LISTEN >/dev/null 2>&1; then PORT="$P"; break; fi
done
if [ -z "$PORT" ]; then
  echo "Couldn't find a free port to serve on (tried 8080/8181/8282/4321/7000)." >&2
  exit 1
fi

URL="http://localhost:${PORT}/fireform-story.html"
echo "FireForm pitch → ${URL}"
echo "Reminder: also start the frontend (npm run dev) and backend (make fireform) for the live demo."
echo "Press Ctrl+C to stop."

# Open the browser once, then serve in the foreground.
( sleep 1; open "${URL}" ) >/dev/null 2>&1 &
exec python3 -m http.server "${PORT}"
