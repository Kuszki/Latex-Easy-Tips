#!/bin/bash

# Konwertuj pliki 'odg' z folderu 'obrazki' do formatu 'pdf'
[ -f obrazki/*.odg ] && libreoffice --convert-to pdf obrazki/*.odg --outdir obrazki

# Konwertuj pliki 'svg' z folderu 'obrazki' do formatu 'pdf'
[ -f obrazki/*.svg ] && inkscape -D obrazki/*.svg --export-type pdf

# Uruchom kompilacje dokumentu i zapisz wyniki do katalogu 'budowa'
latexmk -shell-escape -pdflua -f -output-directory=budowa thesis.tex
