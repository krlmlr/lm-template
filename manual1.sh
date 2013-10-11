#!/bin/sh

TMP=tmp_manual1

rm -rf $TMP
mkdir -p $TMP
pdflatex -output-directory=$TMP texput
bibtex $TMP/texput
pdflatex -output-directory=$TMP texput
pdflatex -output-directory=$TMP texput

