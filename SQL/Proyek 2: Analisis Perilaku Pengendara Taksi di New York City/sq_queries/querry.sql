1.Berapa banyak perjalanan yang dilakukan per bulan?
Query SQL:
SELECT 
    data_file_month as month,
    COUNT(*) as num_trips
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY 
    month
ORDER BY 
    month;

2.Berapa durasi rata-rata perjalanan?
Query SQL:
SELECT 
    AVG(TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE)) as average_duration
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`;

3.Bagaimana pola penumpang taksi?
Query SQL:
SELECT 
    EXTRACT(HOUR FROM pickup_datetime) as pickup_hour,
    COUNT(*) as total_trips,
    AVG(passenger_count) as avg_passenger_count
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
GROUP BY 
    pickup_hour
ORDER BY 
    pickup_hour;

4.Berapa tarif rata-rata per mile?
Query SQL:
SELECT 
    AVG(fare_amount / trip_distance) as average_rate_per_mile
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE 
    trip_distance > 0;

5.Bagaimana hubungan antara jarak dan durasi perjalanan dengan tarif?
Query SQL:
SELECT 
    trip_distance, 
    TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE) as trip_duration,
    fare_amount / trip_distance as rate_per_mile
FROM 
    `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2021`
WHERE 
    trip_distance > 0 
    AND TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, MINUTE) > 0;
