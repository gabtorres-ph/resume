# Gabriel Torres - LaTeX resume learning project

This project converts the supplied resume into LaTeX while separating **content**,
**presentation**, and **document assembly**. That separation is the main idea to
learn: it is similar to keeping Python data, application logic, and configuration
in different modules.

## Quick start on Ubuntu

Install a compact TeX Live setup:

```bash
sudo apt update
sudo apt install latexmk texlive-latex-base texlive-latex-extra
```

Build everything:

```bash
make
```

The finished PDF will be at `build/resume.pdf`.

Clean generated files:

```bash
make clean
```

## Project map

| File | Python analogy | Purpose |
| --- | --- | --- |
| `resume.tex` | `main.py` | Small entry point that assembles the document |
| `resume-style.tex` | shared module/config | Packages, page geometry, colors, and reusable commands |
| `resume-content.tex` | data/content module | The complete resume text |
| `learning/step-01-minimal.tex` | hello-world script | Minimum working LaTeX document |
| `learning/step-02-layout.tex` | refactoring exercise | Introduces packages, links, spacing, and sections |
| `learning/step-03-commands.tex` | helper-functions exercise | Introduces custom commands used by the final resume |
| `Makefile` | task runner | Repeatable build commands |

## Learn it in four short sessions

### 1. Compile the smallest document

```bash
make step-01
```

Open `learning/step-01-minimal.tex`. Notice the three phases:

1. `\documentclass` selects the base document type.
2. The preamble configures the document.
3. `\begin{document}` to `\end{document}` is rendered content.

Try changing the name and recompiling.

### 2. Add layout and links

```bash
make step-02
```

Read `learning/step-02-layout.tex`. The `geometry` package controls page margins,
while `hyperref` creates clickable links. Try changing `margin=0.65in` to
`margin=1in` and compare the result.

### 3. Replace repetition with commands

```bash
make step-03
```

Read `learning/step-03-commands.tex`. A command such as `\experience` is close to
a Python function: it has parameters and emits consistently formatted output.
Change the formatting inside the command once and observe every call change.

### 4. Read and modify the production version

```bash
make resume
```

Start at `resume.tex`, then follow its two `\input` statements. Edit wording in
`resume-content.tex`; edit visual rules in `resume-style.tex`. This keeps content
changes from accidentally breaking the layout.

## Useful LaTeX syntax

| LaTeX | Meaning |
| --- | --- |
| `% comment` | Comment; like `#` in Python |
| `\textbf{word}` | Bold text |
| `\emph{word}` | Emphasized text |
| `\href{URL}{label}` | Clickable link |
| `\begin{itemize} ... \end{itemize}` | Bullet list environment |
| `\input{file}` | Insert another source file |
| `\newcommand{\name}[2]{...}` | Define a reusable command with two arguments |
| `\&`, `\%`, `\$`, `\_` | Escaped special characters |

## Suggested experiments

1. In `resume-style.tex`, change `accent` from blue to dark green.
2. Change `\setlist[itemize]{...}` to make bullets tighter or looser.
3. Add a new `\skillrow` in `resume-content.tex`.
4. Add an optional third argument to a command in the learning file.
5. Deliberately remove a closing brace, compile, and read the first error. LaTeX
   errors cascade much like parser errors, so fix the first useful error first.

## Notes

- The content follows the supplied resume. Obvious typography was normalized,
  including `GitHub`, `JavaScript`, `GeoTIFFs`, and `City`.
- The layout uses standard TeX Live packages and `pdflatex`; no custom fonts or
  resume class are required.
- The source is plain text, so it works well with Git and code review.
