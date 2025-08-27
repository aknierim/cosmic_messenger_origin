TeXInputs = TEXINPUTS=.:


define inksvg
	inkscape \
				--pdf-poppler \
				--export-type=$() \
				--export-text-to-path \
				--export-area-drawing \
				--export-filename=$(2) \
				$(1)
endef



all: build/cm_overview.pdf build/cm_overview_accelerator.pdf build/cm_overview_grav.pdf

build/%.pdf: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc --jobname=$* cm_overview.tex

build/%_accelerator.pdf: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc --jobname=$*_accelerator cm_overview.tex

build/%_grav.pdf: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc --jobname=$*_grav cm_overview.tex

build/black_hole.pdf:
	$(TeXInputs) latexmk -r ./latexmkrc black_hole.tex

preview: FORCE build/black_hole.pdf | build
	$(TeXInputs) latexmk -r ./latexmkrc -pvc cm_overview.tex

preview_black_hole:
	$(TeXInputs) latexmk -r ./latexmkrc -pvc black_hole.tex

build/cm_overview.svg: build/cm_overview.pdf
	$(call inksvg,$<,$@)


convert_png: build/cm_overview.png build/cm_overview_accelerator.png

build/cm_overview.png: build/cm_overview.pdf
	convert -density 600 $< $@

build/cm_overview_accelerator.png: build/cm_overview_accelerator.pdf
	convert -density 600 $< $@


FORCE:

build:
	mkdir -p build/

clean:
	rm -rf build

.PHONY: FORCE all clean
