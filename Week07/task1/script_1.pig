players = LOAD '/user/cloudera/Salaries.csv'
    USING PigStorage(',')
    AS (yearID:int, teamID:chararray, lgID:chararray, playerID: chararray, salary:float);

selected_players = FILTER players BY (yearID == 1985);
grouped_teams = GROUP selected_players by teamID;
min_salary_team = FOREACH grouped_teams GENERATE group, MIN(selected_players.salary) AS salary;
result = FILTER min_salary_team BY salary > 100000;
dump result;
