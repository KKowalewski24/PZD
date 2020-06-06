flights = load '/user/cloudera/SEAflights.csv'
    USING PigStorage(',')
    as (Year,Month,DayofMonth,DayOfWeek,DepTime,CRSDepTime,
    ArrTime,CRSArrTime,UniqueCarrier,FlightNum,TailNum,ActualElapsedTime,
    CRSElapsedTime,AirTime,ArrDelay,DepDelay,Origin,Dest,Distance:float,TaxiIn,
    TaxiOut,Cancelled,CancellationCode,Diverted,CarrierDelay,WeatherDelay,
    NASDelay,SecurityDelay,LateAircraftDelay);

--A. Ile razem mil zostało wylatanych?
grouped_flights_all = group flights all;
total_distance = foreach grouped_flights_all generate SUM(flights.Distance);
store total_distance into './total_distance.out';

--B. Ile mil zostało wylatanych do poszczególnych miejsc?
grouped_flights_destination = group flights by Dest;
total_distance_destination = foreach grouped_flights_destination generate group, SUM(flights.Distance);
store total_distance_destination into './total_distance_destination.out';
