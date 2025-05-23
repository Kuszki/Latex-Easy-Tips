#========================= Parametry symulacji =========================
x_min = -5;                   # Minimalna wartość wielkości wejściowej
x_max = 5;                    # Maksymalna wartość wielkości wejściowej
n_q   = 2^8;                  # Liczba kwantów przetwornika
n_var = 1e-3;                 # Wariancja sygnału szumu białego
#========================= Obliczenia  wstępne =========================
q = (x_max - x_min) / n_q;                      # Oblicz wartość kwantu
f = @(x) get_adc_error(q, x_max, x_min, n_var); # Utwórz funkcję f(x)
#============================== Symulacja ==============================
err = pararrayfun(nproc, f, 1 : 1e5); # Uruchom obliczenia równolegle
#============================ Podsumowanie =============================
u = get_uncertainty(err, 95); # Wyznacz niepewność rozszerzoną
