SHELL=/bin/bash

all: texput.png

clean:
	latexmk -C
	git clean -n -x

%.pdf: %.tex
	latexmk -pdf $<

%-crop.pdf: %.pdf
	pdfcrop $<

%.png: %-crop.pdf
	convert -density 150 $< $@

%.tex: %.Rnw
	R --no-save <<<"library(knitr); knit('$<', output='$@')" || true

%.odt: %.tex
	latexmk $<
	htlatex $< "xhtml,ooffice,bib-,NoFonts,graphics-300,hidden-ref" "ooffice/! -cmozhtf" "-coo -cvalidate"
