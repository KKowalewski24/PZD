movies = load '/user/cloudera/movies_data.csv'
    USING PigStorage(',')
    as (identyfikator:int, tytul:chararray,rok:int, ocena:float, czas_trwania:int);

grouped_movies_all = group movies all;

-- PODPUNKT A
count_star_1= foreach grouped_movies_all generate COUNT_STAR(movies.rok);
dump count_star_1;

-- PODPUNKT B
count_1 = foreach grouped_movies_all generate COUNT(movies.rok);
dump count_1;

-- PODPUNKT C
minimum = foreach grouped_movies_all generate MIN(movies.rok);
dump minimum;

-- PODPUNKT D
maximum = foreach grouped_movies_all generate MAX(movies.rok);
dump maximum;

-- PODPUNKT E
sum_1 = foreach grouped_movies_all generate SUM(movies.rok);
dump sum_1;

-- PODPUNKT F
avg_1 = foreach grouped_movies_all generate AVG(movies.rok);
dump avg_1;
