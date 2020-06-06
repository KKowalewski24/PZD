batting = load '/user/cloudera/Batting.csv'
    USING PigStorage(',')
    as (playerID:chararray,yearID:int,stint:int,teamID:chararray,lgID:chararray,G:int,
    G_batting:int,AB:int,R:int,H:int,a2B:int,a3B:int,HR:int,RBI:int,SB:int,CS:int,BB:int,
    SO:int,IBB:int,HBP:int,SH:int,SF:int,GIDP:int,G_old:int);

selected_batting = FILTER batting BY (yearID == 1980);
players = GROUP selected_batting BY playerID;
games = FOREACH players GENERATE group, SUM(selected_batting.G_batting) as games_sum;
ordered_games = ORDER games BY games_sum DESC;
result = LIMIT ordered_games 10;
dump result;
