TeXInputs = TEXINPUTS=.:

all: build/cr_overview.pdf

build/cr_overview.pdf: FORCE | build
	$(TeXInputs) latexmk -r ./latexmkrc cr_overview.tex

preview: FORCE | build
	$(TeXInputs) latexmk -r ./latexmkrc -pvc cr_overview.tex

preview_black_hole:
	$(TeXInputs) latexmk -r ./latexmkrc -pvc black_hole.tex

FORCE:

build:
	mkdir -p build/

clean:
	rm -rf build

.PHONY: FORCE all clean
