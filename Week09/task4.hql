--
-- Tresc polecenia: Pokaż graczy którzy zdobyli ponad 45 home run (HR) w sezonie.
--

-- Tworzenie bazy
CREATE DATABASE baseball;

CREATE TABLE baseball.batting (
    yearid   INT,
    round    STRING,
    playerid STRING,
    teamid   STRING,
    lgid     STRING,
    g        INT,
    ab       INT,
    r        INT,
    h        INT,
    a2b      INT,
    a3b      INT,
    hr       INT,
    rbi      INT,
    sb       INT,
    cs       INT,
    bb       INT,
    so       INT,
    ibb      INT,
    hbp      INT,
    sh       INT,
    sf       INT,
    gid      INT
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/BattingPost.csv' OVERWRITE INTO TABLE baseball.batting;

SELECT yearid, playerid, hr
FROM baseball.batting
WHERE hr > 45;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;

-- Wynik
-- Brak takich rekordów - The operation has no results.
