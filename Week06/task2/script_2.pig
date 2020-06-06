movies = load '/user/cloudera/movies_data.csv'
    USING PigStorage(',')
    as (identyfikator:int, tytul:chararray,rok:int, ocena:float, czas_trwania:int);

flights = load '/user/cloudera/SEAflights.csv'
    USING PigStorage(',')
    as (Year,Month,DayofMonth,DayOfWeek,DepTime,CRSDepTime,
    ArrTime,CRSArrTime,UniqueCarrier,FlightNum,TailNum,ActualElapsedTime,
    CRSElapsedTime,AirTime,ArrDelay,DepDelay,Origin,Dest,Distance:float,TaxiIn,
    TaxiOut,Cancelled,CancellationCode,Diverted,CarrierDelay,WeatherDelay,
    NASDelay,SecurityDelay,LateAircraftDelay);

-- PODPUNKT A
join_1 = join movies by $0, flights by $0;
dump join_1

join_2 = join movies by $0 left outer, flights by $0;
dump join_2;

join_3 = join movies by $0 right, flights by $0;
dump join_3;

join_4 = join movies by $0 full outer, flights by $0;
dump join_4;

-- PODPUNKT B
unioned = union movies, flights;
dump unioned;
