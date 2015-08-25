SHELL=/bin/bash

all: texput.pdf texput.png

clean:
	latexmk -C
	git clean -f -X

%.pdf: %.tex
	latexmk -pdf $<

%-crop.pdf: %.pdf
	pdfcrop $<

%.png: %-crop.pdf
	convert -density 1200 $< $@

%.tex: %.Rnw
	R --no-save <<<"library(knitr); knit('$<', output='$@')" || true

%.odt: %.tex
	latexmk $<
	mk4ht oolatex $< "xhtml,ooffice,bib-"

%.html: %.tex
	latexmk $<
	mk4ht htlatex $< "xhtml,bib-"
