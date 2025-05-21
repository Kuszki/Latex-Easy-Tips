# Utwórz nowy wykres (jesli uruchomiono z terminala -- ukryj go)
h = figure('visible', ifelse(isguirunning(), 'on', 'off'));

# Ustaw rozmiar dla rysunku (w przykładzie 16x6.45 cm)
set(h, "paperunits", "centimeters")      # Jednostki wymiarów
set(h, "papersize", [16 6.45])           # Wymiary rysunku
set(h, "paperposition", [0, 0, 16 6.45]) # Pozycja rysunku

# Ustaw marginesy, pozycję i rozmiar rysunku (wymaga wprawy)
set(0, "defaultaxesposition", [0.095, 0.225, 0.895, 0.755])

set(0, "defaulttextfontsize", 11) # Ustaw odpowiedni rozmiar czcionki,
set(0, "defaultaxesfontsize", 11) # uwaga na skalowanie w GNU Octave
set(0, "defaulttextfontname", "Latin Modern Roman") # Ustal jednolity
set(0, "defaultaxesfontname", "Latin Modern Roman") # krój czcionki

# Wygeneruj przykładowe dane do narysowania na ich podstawie wykresu
x = -1 : 0.1 : 1;                # Wygeneruj wartośći X
y = 5.65 * x - 2.75;             # Wygeneruj wartości Y
y = y + 0.95*rand(1, length(y)); # Dodaj trochę szumu na pokaz
p = polyfit(x, y, 1);            # Wykonaj dopasowanie do wielomianu
f = x*p(1) + p(2);               # Wyznacz wartości dla aproksymacji

plot(x, y, "x;Dane;", x, f, "-;Aproksymacja;") # Rysuj wykres
ylabel("Napięcie na wyjściu, mV")              # Ustaw opis osi Y
xlabel("Temperatura otoczenia, °C")            # Ustaw opis osi X
legend('location', 'southeast')                # Ustaw pozycję legendy
xlim([-1 1])                                   # Ustaw zakres osi X
ylim([-9 5])                                   # Ustaw zakres osi Y
grid on                                        # Załącz siatkę
box on                                         # Załącz obwódkę

set_format(gca, 'XY')                          # Ustaw format osi

print("-dsvg", "../obrazki/octave_plot.svg")   # Zapisz do pliku SVG
print("-dtikz", "../obrazki/octave_plot.tex")  # Zapisz do pliku TIKZ
