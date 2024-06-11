TeXInputs = TEXINPUTS=.:

all: build/cm_overview.pdf

build/cm_overview.pdf: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc cm_overview.tex

build/black_hole.pdf:
	$(TeXInputs) latexmk -r ./latexmkrc black_hole.tex

preview: FORCE | build
	$(TeXInputs) latexmk -r ./latexmkrc -pvc cm_overview.tex

preview_black_hole:
	$(TeXInputs) latexmk -r ./latexmkrc -pvc black_hole.tex

FORCE:

build:
	mkdir -p build/

clean:
	rm -rf build

.PHONY: FORCE all clean
