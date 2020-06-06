--wczytywanie pliku i wypisywanie do standardowego wejscia
movies = load '/user/cloudera/movies_data.csv'
    USING PigStorage(',')
    as (identyfikator:int, tytul:chararray,rok:int, ocena:float, czas_trwania:int);

dump movies;

--filtrowanie - filmy tylko z 1949r
filtered_1949 = filter movies by (rok == 1949);
store filtered_1949 into './filtered1949.out';

--filtrowanie - filmy 1949-1961
filtered_1949_1961 = filter movies by (rok >= 1949 and rok <= 1961);

--Zapisz do pliku rezultatów tylko kolumny z tytułem i czasem trwania w minutach
filtered_columns = foreach filtered_1949_1961 generate tytul, czas_trwania/60;
store filtered_columns into './filtered_columns.out';

--uporzadkowanie filmow malejąco po roku
order_by_year = order filtered_1949_1961 by rok desc;
store order_by_year into './order_by_year.out';
