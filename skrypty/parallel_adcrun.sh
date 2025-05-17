parallel `# Uruchom funkcję realizującą obliczenia wsadowo, przy czym` \
	-a parallel_input.csv     `# użyj wskazanego pliku z danymi,       ` \
	--colsep ';'              `# przyjmij ';' jako separator kolumn,   ` \
	--header                  `# wczytaj nazwy parametrów z nagłówka.  ` \
	: 'octave --eval "octave_adcbatch({nq}, {x_max}, {x_min}, {n_var})"' \
	| tee nazwa_pliku_wyjściowego.csv # Zapisz dane wyjściowe do pliku
