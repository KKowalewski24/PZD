white_house = load '/user/cloudera/WhiteHouseVisitorsLog_small.csv'
    USING PigStorage(',')
    as(NAMELAST,NAMEFIRST,NAMEMID,UIN,BDGNBR,ACCESS_TYPE,TOA,POA,
    TOD,POD,APPT_MADE_DATE,APPT_START_DATE,APPT_END_DATE,
    APPT_CANCEL_DATE,Total_People,LAST_UPDATEDBY,POST,LastEntryDate,
    TERMINAL_SUFFIX,visitee_namelast,visitee_namefirst,MEETING_LOC,
    MEETING_ROOM,CALLER_NAME_LAST,CALLER_NAME_FIRST,CALLER_ROOM,
    description,RELEASE_DATE);

--A. Wskaż 10 osób najczęściej odwiedzających: NAMELAST, NAMEFIRST
visitors = foreach white_house generate (NAMELAST, NAMEFIRST) as name;
grouped_visitors = group visitors by name;
count_visitors = foreach grouped_visitors generate group, COUNT(visitors);
order_visitors = order count_visitors by $1 desc;
limit_visitors = limit order_visitors 10;
store limit_visitors into './limit_visitors.out';

--B. Wskaż 10 osób najczęściej odwiedzanych: visitee_namelast, visitee_namefirst
visitees = foreach white_house generate (visitee_namelast,visitee_namefirst) as name;
group_visitees = group visitees by name;
count_visitees = foreach group_visitees generate group, COUNT(visitees);
order_visitees = order count_visitees by $1 desc;
limit_visitees = limit order_visitees 10;
store limit_visitees into './limit_visitees/out';

--C. Wskaż 10 najczęściej występujących kombinacji odwiedzający - odwiedzany
people = foreach white_house generate (NAMELAST,NAMEFIRST,visitee_namelast,visitee_namefirst) as combination;
group_combo = group people by combination;
count_combo = foreach group_combo generate group, COUNT(people);
order_combo = order count_combo by $1 desc;
limit_combo = limit order_combo 10;
store limit_combo into './limit_combo.out';
