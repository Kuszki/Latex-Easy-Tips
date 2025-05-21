echo "nq;xmax;xmin;nvar;unc" | tee wyniki_eksperymentu.csv &&          \
parallel `# Uruchom funkcję realizującą obliczenia wsadowo, przy czym` \
	-k -a parallel_input.csv  `# użyj wskazanego pliku z danymi,       ` \
	--colsep ';'              `# przyjmij ';' jako separator kolumn,   ` \
	--header                  `# wczytaj nazwy parametrów z nagłówka.  ` \
	: 'octave --eval "octave_adcbatch({nq}, {x_max}, {x_min}, {n_var})"' \
	| tee -a wyniki_eksperymentu.csv # Zapisz dane wyjściowe do pliku
