#========================= Parametry symulacji =========================
x_min = -5;                   # Minimalna wartość wielkości wejściowej
x_max = 5;                    # Maksymalna wartość wielkości wejściowej
n_q   = 2^8;                  # Liczba kwantów przetwornika
n_var = 1e-3;                 # Wariancja sygnału szumu białego
#========================= Obliczenia  wstępne =========================
q = (x_max - x_min) / n_q;    # Oblicz wartość kwantu
#======================== Generowanie  wartości ========================
x = rand(1, 1e5) * (x_max - x_min) + x_min; # Wielkości wejściowe
n = randn(1, 1e5) * sqrt(n_var);            # Realizacje szumu
#========================= Generowanie wyników =========================
y = q * floor((x + n)/q + 0.5);             # Wielkości wyjściowe
err = x - y;                                # Wektor realizacji błędu
#============================ Podsumowanie =============================
u = get_uncertainty(err, 95); # Wyznacz niepewność rozszerzoną
