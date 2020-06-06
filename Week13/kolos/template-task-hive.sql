CREATE DATABASE IF NOT EXISTS a216806;

CREATE TABLE a216806.awardsplayers (
    playerid STRING,
    awardid  STRING,
    yearid   INT,
    lgid     STRING,
    tie      STRING,
    notes    STRING
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/AwardsPlayers.csv' OVERWRITE INTO TABLE a216806.awardsplayers;

CREATE TABLE a216806.people (
    playerid     STRING,
    birthyear    INT,
    birthmonth   INT,
    birthday     INT,
    birthcountry STRING,
    birthstate   STRING,
    birthcity    STRING,
    deathyear    INT,
    deathmonth   INT,
    deathday     INT,
    deathcountry STRING,
    deathstate   STRING,
    deathcity    STRING,
    namefirst    STRING,
    namelast     STRING,
    namegiven    STRING,
    weight       INT,
    height       INT,
    bats         STRING,
    throws       STRING,
    debut        STRING,
    finalgame    STRING,
    retroid      STRING,
    bbrefid      STRING

)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/People.csv' OVERWRITE INTO TABLE a216806.people;


DROP DATABASE a216806 CASCADE;


