#!/bin/sh

mkdir -p tmp_manual
pdflatex -output-directory=tmp_manual texput
bibtex tmp_manual/texput
pdflatex -output-directory=tmp_manual texput
pdflatex -output-directory=tmp_manual texput

