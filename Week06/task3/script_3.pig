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
grouped = group movies by $0;
dump grouped;

-- PODPUNKT B
cogrouped = cogroup movies by $0, flights by $0;
dump cogrouped;
