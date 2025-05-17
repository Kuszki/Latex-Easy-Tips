#========================= Parametry symulacji =========================
x_min = -5;             # Minimalna wartość wielkości wejściowej
x_max = 5;              # Maksymalna wartość wielkości wejściowej
nq    = 2^8;            # Liczba kwantów przetwornika
n_var = 1e-3;           # Wariancja sygnału szumu białego
#========================= Obliczenia  wstępne =========================
q = (x_max - x_min) / nq; # Oblicz wartość kwantu
#============================== Symulacja ==============================
for i = 1 : 1e5
	# Wylosuj wartość realizacji wielkości x ~ U(x_min, x_max)
	x = rand(1, 1) * (x_max - x_min) + x_min;
	# Wylosuj wartość realizacji sygnału szumu ~ N(0, n_var)
	n = randn(1, 1) * sqrt(n_var);
	# Oblicz wartość wielkości wyjściowej przetwornika
	y = q * floor((x + n)/q + 0.5);
	# Oblicz wartość realizacji błędu przetwornika
	err(i) = x - y;
end
#============================ Podsumowanie =============================
u = get_uncertainty(err, 95); # Wyznacz niepewność rozszerzoną
