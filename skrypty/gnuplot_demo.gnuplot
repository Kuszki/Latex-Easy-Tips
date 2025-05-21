# Używaj terminala 'tikz' i wyjścia do pliku we wskazanej lokalizacji
set terminal lua tikz size 15.5, 7         # Rozmiar 15.5x7
set output '../obrazki/gnuplot_demo.tex'   # Plik wyjściowy

# Ustawienia opisu osi (offset dodaje margines do opisu osi)
set xlabel 'Wartości $x$, \unit{\degreeCelsius}' offset 0, -0.5
set ylabel 'Wartości funkcji, \unit{V}' offset -1, 0

set xrange [0:20]                          # Ustaw zakres osi X
set yrange [-1:1]                          # Ustaw zakres osi Y
set format y "\\num{%g}"                   # Ustaw format liczb
set format x "\\num{%g}"                   # stosując 'siunitx'
set grid                                   # Załącz siatkę główną

f(x) = exp(-0.1 * x) * sin(x)              # Przykładowa funkcja

plot f(x) title 'Funkcja $f(x)$' lc 'blue' # Rysuj funkcję
