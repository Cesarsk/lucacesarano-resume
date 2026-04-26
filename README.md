# Resume — Luca Cesarano

Source for [Luca Cesarano](https://lucacesarano.com)'s CV. Built with [Typst](https://typst.app).

## Public URLs

| URL | Behavior |
|---|---|
| <https://cesarsk.github.io/lucacesarano-resume/LucaCesaranoResume.pdf> | Renders the PDF inline in the browser |
| <https://cesarsk.github.io/lucacesarano-resume/> | Auto-redirects to the inline PDF above |
| <https://github.com/Cesarsk/lucacesarano-resume/releases/latest/download/LucaCesaranoResume.pdf> | Forces a file download |

The CV is auto-rebuilt and re-published on every push to `main` via [GitHub Actions](.github/workflows/build.yml).

## Build locally

```bash
make build    # compile main.typ → LucaCesaranoResume.pdf
make watch    # live preview while editing
```

Requires `typst` (e.g. `brew install typst`).
