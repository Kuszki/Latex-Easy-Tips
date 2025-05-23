function octave_adcbatch(n_q, x_max, x_min, n_var)
	q = (x_max - x_min) / n_q;                  # Oblicz wartość kwantu
	x = rand(1e5, 1) * (x_max - x_min) + x_min; # Wielkości wejściowe
	n = randn(1e5, 1) * sqrt(n_var);            # Realizacje szumu
	y = q * floor((x + n)/q + 0.5);             # Wielkości wyjściowe

	err = x - y;                                # Wyznacz błąd
	u = get_uncertainty(err, 95);               # Wyznacz niepewność

	# Wypisz wyniki dla wskazanych parametrów eksperymentu na ekran
	printf("%d;%.5f;%.5f;%.5e;%0.2g\n", n_q, x_max, x_min, n_var, u);

	# Zapisz wartości realizacji sygnału błędu do osobnego pliku
	nazwa = sprintf("err_%d_%.5f_%.5f_%.5e", n_q, x_max, x_min, n_var);
	save("-ascii", nazwa, "err");
end
