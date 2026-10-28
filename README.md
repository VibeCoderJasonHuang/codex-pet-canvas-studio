# Pet Canvas Studio

Create any character as a custom Codex companion. Upload an image, draw a pet
pixel by pixel, design accessories, and animate all nine native Codex states.

Pet Canvas Studio is local-first: character images, drawings, accessories, and
projects stay on the user's machine.

![Pet Canvas Studio](docs/screenshots/studio-desktop.png)

## Features

- Upload PNG, WebP, or JPEG character art.
- Remove a uniform background automatically or preserve transparency.
- Draw a character from scratch on a `48 x 52` pixel canvas.
- Draw independent custom accessories on a transparent overlay.
- Edit nine Codex states with an eight-frame timeline.
- Use pencil, eraser, flood fill, eyedropper, onion skin, undo, and redo.
- Set per-action FPS and looping behavior.
- Combine a neutral mascot, an optional armor template, colors, and accessories.
- Export a native Codex pet ZIP.
- Install directly into `~/.codex/pets` and `~/.codex/avatars`.

![Pixel editor](docs/screenshots/studio-pixel-editor.png)

![Action editor](docs/screenshots/studio-action-editor.png)

## Quick Start

Requirements:

- Node.js 22 or newer
- Python 3.11 or newer

```powershell
npm ci
python -m pip install -r requirements.txt
.\start-studio.ps1
```

The editor opens at `http://127.0.0.1:8787`.

## Development

```powershell
npm run dev
```

The Vite frontend runs on port `5173` and proxies API requests to the local
FastAPI service on port `8787`.

## Verification

```powershell
npm run typecheck
npm run build
python -m unittest discover -s tests -v
npm run smoke
npm run visual
```

`npm run visual` requires a local Chrome installation.

## Portable Build

```powershell
.\build-portable.ps1
```

The build produces `release/PetCanvasStudio-Windows.zip`. Users unzip it and
run `PetCanvasStudio.exe`; Node.js and Python are not required on the user's
machine.

See [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md) for GitHub Releases and deployment
details.

## Project Structure

```text
src/                  React editor and pixel tools
studio/               Local FastAPI service and renderer
assets/base-armor/    Optional armor template
assets/mascots/       Built-in neutral mascot art
tests/                Renderer, exporter, and installer tests
tools/                Build, smoke-test, and visual-test helpers
docs/screenshots/     README screenshots
```

## Privacy

- Uploaded art is processed locally.
- Development caches live in `.studio-cache`; packaged builds use
  `%LOCALAPPDATA%\PetCanvasStudio`.
- No API key or remote image-generation service is required.
- Installing a pet writes only the selected pet and a backup of `config.toml`
  into the user's Codex home.

## License and Assets

Source code is released under the MIT License. See [NOTICE.md](NOTICE.md) for
asset and trademark information. Users are responsible for ensuring that
uploaded images may be redistributed.
