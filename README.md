# Colonna Lab

Website source and build workflow.

## Recommended workflow (easy editing)

Edit `index.md` only, then build with one command.

### Requirements
- `pandoc`
- `asciidoctor`

### Update website
```bash
make update
```

This generates:
- `index.adoc`
- `index.html`

### Preview website locally
```bash
make preview
```

Then open `http://localhost:8000/index.html` in your browser.
If your environment blocks local servers, use:
```bash
make preview-file
```

See [EDITING.md](EDITING.md) for quick templates and examples.
