# Editing Workflow (Markdown-first)

## What to edit

Edit the files in `content/`.

Recommended files:
- `content/00-intro.md`
- `content/10-research.md`
- `content/20-team.md`
- `content/30-publications.md`
- `content/40-contacts.md`

## Build the website

Run:

```bash
make update
```

This updates:
- `index.md`
- `index.adoc`
- `index.html`

## Preview locally

Run:

```bash
make preview
```

Then open `http://localhost:8000/index.html`.

## Quick templates

Use these blocks in the relevant file under `content/` and replace placeholders.

### New research section

```md
## Project Title

### *Short subtitle (optional)*

One paragraph describing the project.

![figure alt](images/used/path_to_figure.png)

This project is in collaboration with
- [Name](https://link), Affiliation
- [Name](https://link), Affiliation

### **Funding**
- Grant / Source
```

### New person (current members)

```md
---

### **Full Name**, Role

![name](images/used/path_to_photo.jpg)

*Short bio paragraph.*

Current work paragraph.

[ORCID](https://orcid.org/...) | [GitHub](https://github.com/...) | [Google Scholar](https://scholar.google.com/...)
```

### New former member

```md
- Full Name, Role, Years
```

## Suggested update cycle

1. Edit the relevant file in `content/`
2. Run `make update`
3. Run `make preview` and review in browser
4. Commit changes
