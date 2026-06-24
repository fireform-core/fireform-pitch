# fireform-pitch 🔥

The pitch materials for **FireForm**: an open-source "report once, file everywhere"
system that gives first responders their time back. FireForm is a recognized
**UN Digital Public Good** and 1st-place winner of the Reboot the Earth hackathon.

## What's here

| File | Description |
|------|-------------|
| `fireform-story.html` | A self-contained HTML slideshow that tells the FireForm story and ends with a **live, embedded demo** of the actual product. |
| `present.command` | Double-click launcher that serves the deck over local http (required for the live demo's microphone/transcription to work). |

## The slideshow

`fireform-story.html` is a single, dependency-free HTML file: no build step, no
install. It walks through one fire from call to aftermath, surfaces the "hidden
second shift" of redundant paperwork, introduces FireForm as the fix, and closes
by embedding the running frontend so you can demo the product live.

**Slide flow:**

1. Title: *Report once. File everywhere.*
2. 02:47, the call (Engine 14, structure fire)
3. 03:02, on scene (the rescue)
4. 05:10, back at the station (the fire's out, the shift isn't)
5. The hidden second shift (one incident, many agencies)
6. What it costs (hours per shift, per responder)
7. Meet FireForm (the solution)
8. How it works (speak once → local AI → auto-fill every form)
9. Since Reboot the Earth (the challenge, the 6-month / ~6-call monthly Salesforce mentorship, where we are now, DPG status, what's next)
10. **Live demo**: embedded FireForm frontend

### Presenting it

**For the story slides only**, just open the file in any browser:

```bash
open fireform-story.html        # macOS
# or double-click it in your file explorer
```

**To demo the live product (with working voice transcription)**, serve the deck
over http instead of opening it as a file: double-click `present.command`, or:

```bash
./present.command               # serves on a free port and opens the browser
```

Why: the last slide embeds the real frontend, and the product records from the
microphone for transcription. Browsers **block microphone access for a
cross-origin iframe when the page is opened as a `file://` URL**, so a
double-clicked deck can't transcribe. Serving over `http://localhost` fixes it.
The deck detects this and warns you on the demo slide if you're on `file://`.

**Navigation:** `←` / `→` or `space` to move between slides, `Home` / `End` to
jump to the first/last slide, or click the dots at the bottom. The on-screen
`‹` `›` buttons work too.

### Wiring up the live demo (last slide)

The final slide embeds the FireForm frontend in an iframe so you can demo the
real product inside the deck. It runs a small **preflight** when you reach it and
shows three status pills in the demo bar (**Mic**, **Frontend**, **Whisper**)
so you can see at a glance what's ready and what isn't.

To make the full live demo (including transcription) work:

1. Serve the deck over http (not `file://`) so the **Mic** pill goes green:

   ```bash
   ./present.command
   ```

2. Start the frontend dev server in `fireform-frontend` (turns **Frontend**
   green):

   ```bash
   cd ../fireform-frontend
   npm run dev
   ```

3. Start the backend + Whisper (turns **Whisper** green, this is what actually
   transcribes the audio); see the `FireForm` repo:

   ```bash
   make init && make fireform        # API on :8000, Whisper on :9000
   ```

4. Advance to the last slide. It auto-loads the renderer at
   **`http://localhost:5173`** (the default electron-vite dev server port). If
   the frontend isn't reachable, the slide shows a preflight checklist instead of
   a blank frame; fix what's red and click **Retry**.

5. If your renderer serves on a different port, edit the URL in the bar at the
   top of the demo slide and click **Load**.

> **Transcription not working?** It needs all three pills green: the deck served
> over http (mic), the frontend up (the record button), and the backend + Whisper
> up (the actual speech-to-text). The most common miss is opening the deck as a
> file: the **Mic** pill turns red and a warning strip explains the fix.

> **Note:** the iframe embeds the **Vite renderer** (an `http://` URL), not the
> Electron shell itself. Vite's dev server doesn't set frame-blocking headers by
> default, so it embeds cleanly. If the server is down or unreachable, the slide
> shows a short helper with the command to start it.

## Editing the slide text

You don't need to touch the HTML to reword slides: edit **`slides.txt`** and
refresh the deck in your browser (it must be served over http, i.e. launched with
`./present.command`; if you open the raw file it falls back to the built-in text).

Format:
- `key: your text`, one line per field (e.g. `s4.title: The fire's out.|The shift isn't.`)
- `*stars*` → orange highlight, `|` → line break, `🔥` keeps its flicker
- `chips:` items separated by `|`; `cards:`/`flow:` items separated by `||` with
  `Title :: body` split by `::`
- Lines starting with `#`, or blank/removed lines, keep the deck's built-in wording

| File | Description |
|------|-------------|
| `slides.txt` | All editable slide copy **and photo slots** (`sN.image`). Edit + refresh; no build step. |
| `images/` | Drop your own photos here to replace a slide's built-in graphic (see `images/README.md`). |

### Visuals

Story slides 2–9 each have a **FireForm-style graphic** built in; they mirror the
real app's palette, components, and flow (the dispatch map, the agency fan-out, the
record → JSON → filled-PDF pipeline, the app window, etc.). To use a real photo
instead, drop a file in `images/` and point its `sN.image` line in `slides.txt` at
it; until then (or if the file's missing) the built-in graphic shows. The location
map slot (`s2.image`) is already pointed at `images/incident-map.png`, just save
your map screenshot there.

## Tips for a clean demo

- Launch with `./present.command` (not a double-clicked file) whenever you plan
  to demo the live product; otherwise the microphone is blocked and
  transcription won't work.
- Start `npm run dev` **and** the backend (`make fireform`) **before** you begin
  presenting, so all three preflight pills are green and the last slide is warm
  when you reach it.
- Present in fullscreen for an edge-to-edge story.
