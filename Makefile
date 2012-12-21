SHELL=/bin/bash

LATEXMK=./latexmk.pl
TMPDIR_BASE=tmp/

all: texput.pdf

clean:
	latexmk -C

%.pdf: %.tex
	mkdir -p $(TMPDIR_BASE)$(subst .pdf,,$@)
	$(LATEXMK) -pdf -recorder -output-directory=$(TMPDIR_BASE)$(subst .pdf,,$@) -r .latexmkrc || true
	[ $@ -ef $(TMPDIR_BASE)$(subst .pdf,,$@)/$@ ] || cp -u -v $(TMPDIR_BASE)$(subst .pdf,,$@)/$@ .
	[ $*.synctex.gz -ef $(TMPDIR_BASE)$(subst .pdf,,$@)/$*.synctex.gz ] || cp -u -v $(TMPDIR_BASE)$(subst .pdf,,$@)/$*.synctex.gz .
