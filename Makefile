LATEXMK = latexmk -pdf -interaction=nonstopmode -halt-on-error
OUT = build

.PHONY: all resume step-01 step-02 step-03 clean

all: resume step-01 step-02 step-03

resume:
	@mkdir -p $(OUT)
	$(LATEXMK) -outdir=$(OUT) resume.tex

step-01:
	@mkdir -p $(OUT)
	$(LATEXMK) -outdir=$(OUT) -jobname=step-01 learning/step-01-minimal.tex

step-02:
	@mkdir -p $(OUT)
	$(LATEXMK) -outdir=$(OUT) -jobname=step-02 learning/step-02-layout.tex

step-03:
	@mkdir -p $(OUT)
	$(LATEXMK) -outdir=$(OUT) -jobname=step-03 learning/step-03-commands.tex

clean:
	latexmk -C -outdir=$(OUT) resume.tex
	latexmk -C -outdir=$(OUT) learning/step-01-minimal.tex
	latexmk -C -outdir=$(OUT) learning/step-02-layout.tex
	latexmk -C -outdir=$(OUT) learning/step-03-commands.tex
	rm -f $(OUT)/step-01.* $(OUT)/step-02.* $(OUT)/step-03.*
