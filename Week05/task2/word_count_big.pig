-- odczytaj plik linijka po linijce
-- kazda linijke wczytujesz jako rekord o nazwie linijka
plik = load '/user/cloudera/BookOne.txt' as (linijka);

-- podziel kazda linijke na tokeny - kazdy znich teraz jest rekordem o nazwie wyraz
wyrazy = foreach plik generate flatten(TOKENIZE(linijka)) as wyraz;

-- pogrupuj razem wyrazy po poszczegolnym wyrazie
grupa = group wyrazy by wyraz;

-- policz wyrazy
policz = foreach grupa generate group, COUNT(wyrazy);

-- wykonaj zadanie na platformie Hadoop i wypisz rezultaty
store policz into './policz_big.out';
