SHELL=/bin/bash

all: texput.png

clean:
	latexmk -C
	git clean -f -x

%.pdf: %.tex
	latexmk -pdf $<

%-crop.pdf: %.pdf
	pdfcrop $<

%.png: %-crop.pdf
	convert -density 150 $< $@

%.tex: %.Rnw
	R --no-save <<<"library(knitr); knit('$<', output='$@')" || true

%.odt: %.tex
	latexmk -pdf $<
	mk4ht oolatex $< "my,ooffice,bib-"
