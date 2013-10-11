#!/bin/sh

rm -rf tmp_manual
mkdir -p tmp_manual
pdflatex -output-directory=tmp_manual texput
cd tmp_manual
sed -r 's-\\bibdata\{-\\bibdata\{../-' texput.aux > texput-bib.aux
bibtex texput-bib
mv texput-bib.blg texput.blg
mv texput-bib.bbl texput.bbl
cd ..
pdflatex -output-directory=tmp_manual texput
pdflatex -output-directory=tmp_manual texput

