--
-- Tresc polecenia: Znajdź zawodnika z najwyższą liczbą AB (At bat) i wylicz dla niego jego średnią odbić bating average (BA=H/AB, H - hits) w każdym roku.
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

CREATE TABLE baseball.batting_summed STORED AS ORC
AS
SELECT playerid, SUM(ab) AS absummed
FROM baseball.batting
GROUP BY playerid
ORDER BY absummed DESC
LIMIT 1;

SELECT bat.yearid, avg(bat.h / bat.ab)
FROM baseball.batting bat, baseball.batting_summed bat_sum
WHERE bat.playerid = bat_sum.playerid
GROUP BY bat.yearid;

-- Propozycja Pani prowadzącej natomiast jakoś dziwnie to działa
-- SELECT b1.playerid, b1.yearid, b1.h / b1.ab
-- FROM baseball.batting b1,
--      (
--          SELECT b2.playerid, max(b2.ab) AS maxab
--          FROM baseball.batting b2
--          GROUP BY b2.playerid
--          ORDER BY maxab DESC
--          LIMIT 1
--      ) b3
-- WHERE b3.playerid = b1.playerid;

-- Usuwania calej bazy na koniec dzialania
DROP DATABASE baseball CASCADE;

-- Wynik
-- 1    1996	0.35947712418300654
-- 2	1997	0.33333333333333331
-- 3	1998	0.22135076252723315
-- 4	1999	0.38582887700534757
-- 5	2000	0.31259968102073366
-- 6	2001	0.23674655047204066
-- 7	2002	0.5
-- 8	2003	0.33601953601953599
-- 9	2004	0.25789473684210529
-- 10	2005	0.33333333333333331
-- 11	2006	0.5
-- 12	2007	0.17647058823529413
-- 13	2009	0.35555555555555557
-- 14	2010	0.25824175824175821
-- 15	2011	0.25
-- 16	2012	0.28181818181818186
