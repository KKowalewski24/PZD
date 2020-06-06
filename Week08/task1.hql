-- Tworzenie bazy
CREATE DATABASE baseball;

-- Wyświeltanie informacji o bazach
SHOW DATABASES;
SHOW DATABASES LIKE 'bas.*';

-- Dodawanie property do bazy
ALTER DATABASE baseball SET DBPROPERTIES ('owner' = 'Jan Karwowski Kamil Kowalewski');
DESCRIBE DATABASE EXTENDED baseball;

-- Tworzenie tabeli
CREATE TABLE baseball.temp_salary (
    year      INT,
    team_id   STRING,
    league_id STRING,
    player_id STRING,
    salary    DECIMAL(10, 2)
);

-- Usuwanie tabeli
DROP TABLE baseball.temp_salary;

-- Tworzenie jeszcze raz tabeli - w poprawny sposób
CREATE TABLE baseball.temp_salary (
    year      INT,
    team_id   STRING,
    league_id STRING,
    player_id STRING,
    salary    DECIMAL(10, 2)
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n';

-- W razie błedu działania - Najpierw trzeba dodać plik Salaries.csv do /user/cloudera
-- Plik Salaries.csv usuwa sie po każdym wykonaniu tej komendy
LOAD DATA INPATH '/user/cloudera/Salaries.csv' OVERWRITE INTO TABLE baseball.temp_salary;

-- Wyswietlanie rekordow z tabeli temp_salary
SELECT *
FROM baseball.temp_salary;

-- Usuwanie pierwszego wiersza z tabeli temp_salary
ALTER TABLE baseball.temp_salary
    SET
        TBLPROPERTIES ("skip.header.line.count" = "1");

-- Wyswietlanie rekordow z tabeli temp_salary
SELECT *
FROM baseball.temp_salary;

-- Tworzenie tabeli poprzez przepisanie rekordow z tabeli temp_salary
CREATE TABLE baseball.salary STORED AS ORC AS
SELECT *
FROM baseball.temp_salary;

-- Wyswietlenie rozszerzonych informacji o tabelach
DESCRIBE EXTENDED baseball.salary;
DESCRIBE EXTENDED baseball.temp_salary;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;
