TeXInputs = TEXINPUTS=.:


define inksvg
	inkscape \
				--pdf-poppler \
				--export-type=svg \
				--export-text-to-path \
				--export-area-drawing \
				--export-filename=$(2) \
				$(1)
endef



all: build/cm_overview.pdf

build/cm_overview.pdf: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc cm_overview.tex

build/black_hole.pdf:
	$(TeXInputs) latexmk -r ./latexmkrc black_hole.tex

preview: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc -pvc cm_overview.tex

preview_black_hole:
	$(TeXInputs) latexmk -r ./latexmkrc -pvc black_hole.tex

build/cm_overview.svg: build/cm_overview.pdf
	$(call inksvg,$<,$@)

FORCE:

build:
	mkdir -p build/

clean:
	rm -rf build

.PHONY: FORCE all clean
