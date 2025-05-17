function octave_adcbatch(nq, x_max, x_min, n_var)
	q = (x_max - x_min) / nq;                   # Oblicz wartość kwantu
	x = rand(1, 1e5) * (x_max - x_min) + x_min; # Wielkości wejściowe
	n = randn(1, 1e5) * sqrt(n_var);            # Realizacje szumu
	y = q * floor((x + n)/q + 0.5);             # Wielkości wyjściowe
	u = get_uncertainty(x - y, 95);             # Wyznacz niepewność

	# Wypisz wyniki dla wskazanych parametrów eksperymentu na ekran
	printf("%d;%.2f;%.2f;%.2e;%0.5g\n", nq, x_max, x_min, n_var, u);
end
