--
-- Tresc polecenia: Podaj dane 5 baseballistów, którzy zarobili najwięcej w swojej karierze zawodowej.
--

-- Tworzenie bazy
CREATE DATABASE baseball;

-- Tworzenie jeszcze raz tabeli - w poprawny sposób
CREATE TABLE baseball.salary (
    year      INT,
    team_id   STRING,
    league_id STRING,
    player_id STRING,
    salary    DECIMAL(10, 2)
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

-- W razie błedu działania - Najpierw trzeba dodać plik Salaries.csv do /user/cloudera
-- Plik Salaries.csv usuwa sie po każdym wykonaniu tej komendy
LOAD DATA INPATH '/user/cloudera/Salaries.csv' OVERWRITE INTO TABLE baseball.salary;

-- Wyswietlanie najwyzszego wynagrodzenia dla danego zawodnika
SELECT player_id, MAX(salary)
FROM baseball.salary
GROUP BY player_id;

-- Opis sposobu powyzszego zapytania
EXPLAIN
SELECT player_id, MAX(salary)
FROM baseball.salary
GROUP BY player_id;

SELECT player_id, SUM(salary) AS summed
FROM baseball.salary
GROUP BY player_id
ORDER BY summed DESC
LIMIT 5;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;

-- Wynik
--  	player_id	salary_sum
-- 1	rodrial01	355416252
-- 2	jeterde01	252618093
-- 3	ramirma02	206827769
-- 4	bondsba01	188245322
-- 5	johnsra05	175550019
