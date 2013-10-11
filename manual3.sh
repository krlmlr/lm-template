#!/bin/sh

TMP=tmp_manual3

rm -rf $TMP
rm -rf $TMP
mkdir -p $TMP
pdflatex -output-directory=$TMP texput
cd $TMP
sed -r 's-\\bibdata\{-\\bibdata\{../-' texput.aux > texput-bib.aux
bibtex texput-bib
mv texput-bib.blg texput.blg
mv texput-bib.bbl texput.bbl
cd ..
pdflatex -output-directory=$TMP texput
pdflatex -output-directory=$TMP texput

