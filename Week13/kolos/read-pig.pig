-- AllstarFull -----------------------------------------------------------------------------
data = load '/user/cloudera/AllstarFull.csv'
    USING PigStorage(',')
    as (playerID:chararray,yearID:int,gameNum:int,gameID:chararray,
    teamID:chararray,lgID:chararray,GP:int,startingPos:int);

-- AwardsPlayer -----------------------------------------------------------------------------

data = load '/user/cloudera/AwardsPlayers.csv'
    USING PigStorage(',')
    as (playerID:chararray,awardID:chararray,
    yearID:int,lgID:chararray,tie:chararray,notes:chararray);

-- CollegePlaying -----------------------------------------------------------------------------

data = load '/user/cloudera/CollegePlaying.csv'
    USING PigStorage(',')
    as (playerID:chararray,schoolID:chararray,yearID:int);

-- People -----------------------------------------------------------------------------

data = load '/user/cloudera/People.csv'
    USING PigStorage(',')
    as (playerID:chararray,birthYear:int,birthMonth:int,birthDay:int,
    birthCountry:chararray,birthState:chararray,birthCity:chararray,deathYear:int,
    deathMonth:int,deathDay:int,deathCountry:chararray,deathState:chararray,
    deathCity:chararray,nameFirst:chararray,nameLast:chararray,nameGiven:chararray,weight:int,
    height:int,bats:chararray,throws:chararray,debut:chararray,finalGame:chararray,retroID:chararray,bbrefID:chararray);

-- Schools -----------------------------------------------------------------------------

data = load '/user/cloudera/Schools.csv'
    USING PigStorage(',')
    as (schoolID:chararray,name_full:chararray,city:chararray,state:chararray,country:chararray);

-- Teams -----------------------------------------------------------------------------

data = load '/user/cloudera/Teams.csv'
    USING PigStorage(',')
    as (yearID:int,lgID:chararray,teamID:chararray,franchID:chararray,divID:chararray,Rank:int,
    G:int,Ghome:int,W:int,L:int,DivWin:chararray,WCWin:chararray,LgWin:chararray,WSWin:chararray,R:int,AB:int,H:int,
    a2B:int,a3B:int,HR:int,BB:int,SO:int,SB:int,CS:int,HBP:int,SF:int,RA:int,ER:int,ERA:float,CG:int,SHO:int,
    SV:int,IPouts:int,HA:int,HRA:int,BBA:int,SOA:int,E:int,DP:int,FP:float,name:chararray,park:chararray,
    attendance:int,BPF:int,PPF:int,teamIDBR:chararray,teamIDlahman45:chararray,teamIDretro:chararray);

