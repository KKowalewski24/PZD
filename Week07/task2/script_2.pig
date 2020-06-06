players = load '/user/cloudera/Salaries.csv'
    USING PigStorage(',')
    as (yearID:int, teamID:chararray, lgID:chararray, playerID: chararray, salary:float);

selected_players = FILTER players BY (yearID == 1998);
grouped_teams = GROUP selected_players by teamID;
result = FOREACH grouped_teams GENERATE group, AVG(selected_players.salary);
dump result;
