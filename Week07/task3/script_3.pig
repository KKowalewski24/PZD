players = load '/user/cloudera/Salaries.csv'
    USING PigStorage(',')
    as (yearID:int, teamID:chararray, lgID:chararray, playerID: chararray, salary:float);

selected_players = FILTER players BY (yearID == 1999);
grouped_league = GROUP selected_players BY lgID;
result = FOREACH grouped_league {dist = DISTINCT selected_players.teamID; GENERATE group, COUNT(dist);};
dump result;
