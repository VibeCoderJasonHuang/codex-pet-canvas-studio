# Contributing

## Development Setup

```powershell
npm ci
python -m pip install -r requirements.txt
npm run dev
```

## Checks

```powershell
npm run typecheck
npm run build
python -m unittest discover -s tests -v
```

Keep generated builds, browser caches, user uploads, and Codex configuration
out of commits.

## Pull Requests

- Keep changes focused.
- Include tests for renderer, exporter, or installer behavior changes.
- Include screenshots for visible UI changes.
- Do not commit API keys, access tokens, personal images, or local Codex data.
