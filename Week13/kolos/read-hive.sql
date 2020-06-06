-- AllstarFull -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.allstarfull (
    playerid    STRING,
    yearid      INT,
    gamenum     INT,
    gameid      STRING,
    teamid      STRING,
    lgid        STRING,
    gp          INT,
    startingpos INT
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/AllstarFull.csv' OVERWRITE INTO TABLE baseball.allstarfull;



DROP DATABASE baseball CASCADE;

-- AwardsPlayers -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.awardsplayers (
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

LOAD DATA INPATH '/user/cloudera/AwardsPlayers.csv' OVERWRITE INTO TABLE baseball.awardsplayers;



DROP DATABASE baseball CASCADE;

-- CollegePlaying -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.collegeplaying (
    playerid STRING,
    schoolid STRING,
    yearid   INT
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/CollegePlaying.csv' OVERWRITE INTO TABLE baseball.collegeplaying;



DROP DATABASE baseball CASCADE;

-- People -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.people (
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

LOAD DATA INPATH '/user/cloudera/People.csv' OVERWRITE INTO TABLE baseball.people;



DROP DATABASE baseball CASCADE;

-- Schools -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.schools (
    schoolid  STRING,
    name_full STRING,
    city      STRING,
    state     STRING,
    country   STRING
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/Schools.csv' OVERWRITE INTO TABLE baseball.schools;



DROP DATABASE baseball CASCADE;

-- Teams -----------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS baseball;

CREATE TABLE baseball.teams (
    yearid         INT,
    lgid           STRING,
    teamid         STRING,
    franchid       STRING,
    divid          STRING,
    rank           INT,
    g              INT,
    ghome          INT,
    w              INT,
    l              INT,
    divwin         STRING,
    wcwin          STRING,
    lgwin          STRING,
    wswin          STRING,
    r              INT,
    ab             INT,
    h              INT,
    a2b             INT,
    a3b             INT,
    hr             INT,
    bb             INT,
    so             INT,
    sb             INT,
    cs             INT,
    hbp            INT,
    sf             INT,
    ra             INT,
    er             INT,
    era            FLOAT,
    cg             INT,
    sho            INT,
    sv             INT,
    ipouts         INT,
    ha             INT,
    hra            INT,
    bba            INT,
    soa            INT,
    e              INT,
    dp             INT,
    fp             FLOAT,
    name           STRING,
    park           STRING,
    attendance     INT,
    bpf            INT,
    ppf            INT,
    teamidbr       STRING,
    teamidlahman45 STRING,
    teamidretro    STRING
)
    ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\n'
    TBLPROPERTIES ("skip.header.line.count" = "1");

LOAD DATA INPATH '/user/cloudera/Teams.csv' OVERWRITE INTO TABLE baseball.teams;



DROP DATABASE baseball CASCADE;
