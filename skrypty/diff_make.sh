# Wygeneruj plik podkreślający różnicę pomiędzy starą i nową wersją
latexdiff --flatten --ignore-warnings stary.tex nowy.tex > diff.tex

# Zbuduj plik 'PDF' z oznaczonymi zmianami w katalogu 'budowa'
latexmk -shell-escape -pdflua -f -output-directory=budowa diff.tex
