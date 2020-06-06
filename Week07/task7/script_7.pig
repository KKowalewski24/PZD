players = load '/user/cloudera/Salaries.csv'
    USING PigStorage(',')
    as (yearID:int, teamID:chararray, lgID:chararray, playerID: chararray, salary:float);

batting = load '/user/cloudera/Batting.csv'
    USING PigStorage(',')
    as (playerID:chararray,yearID:int,stint:int,teamID:chararray,lgID:chararray,G:int,
    G_batting:int,AB:int,R:int,H:int,a2B:int,a3B:int,HR:int,RBI:int,SB:int,CS:int,BB:int,
    SO:int,IBB:int,HBP:int,SH:int,SF:int,GIDP:int,G_old:int);

selected_players = FILTER players BY(yearID == 2001 and salary > 500000);
selected_batting = FILTER batting BY(HR > 50);
result = JOIN selected_batting BY playerID, selected_players BY playerID;
dump result;
