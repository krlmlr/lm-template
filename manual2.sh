#!/bin/sh

mkdir -p tmp_manual
pdflatex -output-directory=tmp_manual texput
cd tmp_manual
BIBINPUTS=.. bibtex texput
cd ..
pdflatex -output-directory=tmp_manual texput
pdflatex -output-directory=tmp_manual texput

