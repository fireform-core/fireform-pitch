# fireform-pitch 🔥

The pitch materials for **FireForm** — an open-source "report once, file everywhere"
system that gives first responders their time back. FireForm is a recognized
**UN Digital Public Good** and 1st-place winner of the Reboot the Earth hackathon.

## What's here

| File | Description |
|------|-------------|
| `fireform-story.html` | A self-contained HTML slideshow that tells the FireForm story and ends with a **live, embedded demo** of the actual product. |

## The slideshow

`fireform-story.html` is a single, dependency-free HTML file — no build step, no
install. It walks through one fire from call to aftermath, surfaces the "hidden
second shift" of redundant paperwork, introduces FireForm as the fix, and closes
by embedding the running frontend so you can demo the product live.

**Slide flow:**

1. Title — *Report once. File everywhere.*
2. 02:47 — The call (Engine 14, structure fire)
3. 03:02 — On scene (the rescue)
4. 05:10 — Back at the station (the fire's out, the shift isn't)
5. The hidden second shift (one incident, many agencies)
6. What it costs (hours per shift, per responder)
7. Meet FireForm (the solution)
8. How it works (speak once → local AI → auto-fill every form)
9. The payoff (hours returned, open source, UN DPG)
10. **Live demo** — embedded FireForm frontend

### Presenting it

Just open the file in any browser:

```bash
open fireform-story.html        # macOS
# or double-click it in your file explorer
```

**Navigation:** `←` / `→` or `space` to move between slides, `Home` / `End` to
jump to the first/last slide, or click the dots at the bottom. The on-screen
`‹` `›` buttons work too.

### Wiring up the live demo (last slide)

The final slide embeds the FireForm frontend in an iframe so you can demo the
real product inside the deck. To make it load:

1. Start the frontend dev server in `fireform-frontend`:

   ```bash
   cd ../fireform-frontend
   npm run dev
   ```

   (For the full experience, also have the backend running so the UI has data —
   see the `FireForm` repo: `make init` → `make fireform`.)

2. Advance to the last slide. It auto-loads the renderer at
   **`http://localhost:5173`** (the default electron-vite dev server port).

3. If your renderer serves on a different port, edit the URL in the bar at the
   top of the demo slide and click **Load**.

> **Note:** the iframe embeds the **Vite renderer** (an `http://` URL), not the
> Electron shell itself. Vite's dev server doesn't set frame-blocking headers by
> default, so it embeds cleanly. If the server is down or unreachable, the slide
> shows a short helper with the command to start it.

## Tips for a clean demo

- Start `npm run dev` (and the backend) **before** you begin presenting, so the
  last slide is warm when you reach it.
- Present in fullscreen for an edge-to-edge story.
