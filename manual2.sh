#!/bin/sh

TMP=tmp_manual2

rm -rf $TMP
mkdir -p $TMP
pdflatex -output-directory=$TMP texput
cd $TMP
BIBINPUTS=.. bibtex texput
cd ..
pdflatex -output-directory=$TMP texput
pdflatex -output-directory=$TMP texput

