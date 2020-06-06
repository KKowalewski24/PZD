movies = load '/user/cloudera/movies_data.csv'
    USING PigStorage(',')
    as (identyfikator:int, tytul:chararray,rok:int, ocena:float, czas_trwania:int);

-- PODPUNKT A
DESCRIBE movies;

-- PODPUNKT B
EXPLAIN movies;

-- PODPUNKT C - Nie jestem pewnie czy to na pewno to
limited = limit movies 10;
dump limited;

-- PODPUNKT D
ILLUSTRATE movies;
