#!/bin/bash

# Kompiluj skrypty 'dot' z folderu 'skrypty' i zapisz wyniki do katalogu 'obrazki'
for i in skrypty/*.dot
do
	dot2tex --preproc "$i" \
		| dot2tex -t raw --figonly \
		> "obrazki/$(basename ${i%.dot}).tex"
done

# Kompiluj skrypty 'gnuplot' z folderu 'skrypty'
for i in skrypty/*.gnuplot; do gnuplot "$i"; done

# Konwertuj pliki 'odg' z folderu 'obrazki' do formatu 'pdf'
[ -f obrazki/*.odg ] && libreoffice --convert-to pdf obrazki/*.odg --outdir obrazki

# Konwertuj pliki 'svg' z folderu 'obrazki' do formatu 'pdf'
[ -f obrazki/*.svg ] && inkscape -D obrazki/*.svg --export-type pdf

# Uruchom kompilacje dokumentu i zapisz wyniki do katalogu 'budowa'
latexmk -shell-escape -pdflua -f -output-directory=budowa thesis.tex
