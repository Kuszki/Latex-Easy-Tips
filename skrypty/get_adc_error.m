function err = get_adc_error(q, x_max, x_min, n_var)
	# Wylosuj wartość realizacji wielkości x ~ U(x_min, x_max)
	x = rand(1, 1) * (x_max - x_min) + x_min;
	# Wylosuj wartość realizacji sygnału szumu ~ N(0, n_var)
	n = randn(1, 1) * sqrt(n_var);
	# Oblicz wartość wielkości wyjściowej przetwornika
	y = q * floor((x + n)/q + 0.5);
	# Oblicz wartość realizacji błędu przetwornika
	err = x - y
end
