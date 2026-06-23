# images/

Drop your own photos here to replace the built-in graphics on the story slides.

## How it works
1. Save an image in this folder (PNG or JPG).
2. Open `../slides.txt`, find the **PHOTOS** section, and point the slide's line at
   it, e.g.:
   ```
   s3.image: images/on-scene.jpg
   ```
3. Refresh the deck (served over http via `./present.command`).

A blank line — or a path to a file that isn't here yet — keeps the slide's
built-in FireForm-style graphic, so nothing ever breaks.

## Slots
| Key | Slide | Suggested image |
|-----|-------|-----------------|
| `s2.image` | The Call | **Map screenshot of the location** → save as `incident-map.png` |
| `s3.image` | On Scene | A fire / engine / crew photo |
| `s4.image` | Back at the Station | The station, or the paperwork pile |
| `s5.image` | The Hidden Second Shift | (optional — replaces the agency fan-out graphic) |
| `s6.image` | What It Costs | (optional — replaces the hours chart) |
| `s7.image` | Meet FireForm | A real screenshot of the FireForm app |
| `s8.image` | How It Works | (optional — replaces the flow graphic) |
| `s9.image` | The Payoff | Filed forms, or a department photo |

## Tips
- Aim for ~4:3 (e.g. 1200×900); images are cropped to fill the frame.
- The map slot (`s2.image`) is already pointed at `incident-map.png` — just save
  your map screenshot with that name and it appears automatically.
- Keep files reasonably small (< ~2 MB) so the deck stays snappy.
