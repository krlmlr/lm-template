SHELL=/bin/bash

all: texput.pdf

clean:
	latexmk -C
	git clean -f -X

%.pdf: %.tex
	latexmk -pdf -pdflatex='pdflatex -synctex=1' $<

%-crop.pdf: %.pdf
	pdfcrop $<

%.png: %-crop.pdf
	convert -density 150 $< $@

%.tex: %.Rnw
	R --no-save <<<"library(knitr); knit('$<', output='$@')" || true

%.odt: %.tex
	latexmk $<
	mk4ht oolatex $< "xhtml,ooffice,bib-"
