/*
Date: 4 Mar 2022
Analyst: Eric Chan
Goal: Compare casual riders and annual members bike share usage patterns
*/


-- PROCESS


-- Compared field names, checked data types
-- Union all tripdata tables into one
SELECT
  *
FROM
  divvy.202103_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202104_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202105_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202106_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202107_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202108_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202109_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202110_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202111_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202112_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202201_tripdata
UNION ALL
SELECT
  *
FROM
  divvy.202202_tripdata


-- Check bike types
SELECT
  rideable_type,
  COUNT(rideable_type) AS num_ride
FROM
  divvy.tripdata_raw
GROUP BY
  rideable_type


-- PROCESS


-- Add ride duration
-- Add day of week
SELECT
  *,
  DATETIME_DIFF(ended_at, started_at, MINUTE) AS ride_duration_mins,
  FORMAT_DATE('%a', started_at) AS weekday,
FROM
  divvy.tripdata_raw


-- ANALYSE


-- Descriptive analysis for ride duration. casual vs member
-- Find mean, min, max
-- Check for error. e.g. negative
SELECT
  member_casual,
  AVG(ride_duration_mins) AS avg_ride_duration_mins,
  MIN(ride_duration_mins) AS min_ride_duration_mins,
  MAX(ride_duration_mins) AS max_ride_duration_mins
FROM
  divvy.tripdata
GROUP BY
  member_casual


-- Fix negative ride duration. Assumming mixed up started_at and ended_at time when merging in source data.
SELECT
  *,
  ABS(DATETIME_DIFF(ended_at, started_at, MINUTE)) AS ride_duration_mins,
  FORMAT_DATE('%a', started_at) AS weekday,
FROM
  divvy.tripdata_raw


-- check again descriptive analysis
SELECT
  member_casual,
  AVG(ride_duration_mins) AS avg_ride_duration_mins,
  MIN(ride_duration_mins) AS min_ride_duration_mins,
  MAX(ride_duration_mins) AS max_ride_duration_mins
FROM
  divvy.tripdata_v2
GROUP BY
  member_casual


-- Add ride duration catagories
SELECT
  *,
  CASE
    WHEN ride_duration_mins < 15 THEN "Under 15 mins"
    WHEN ride_duration_mins < 30 THEN "Under 30 mins"
    WHEN ride_duration_mins < 45 THEN "Under 45 mins"
    WHEN ride_duration_mins < 60 THEN "Under 60 mins"
    ELSE "Over an hour"
  END
  AS ride_duration_cat,
FROM
  divvy.tripdata_v2


-- ride duration distribution. causal vs member percentage
-- x = ride duration, under 30 min, under 45 min, under 1 hr, y = num of usage.
SELECT
  member_casual,
  COUNTIF(ride_duration_cat = "Under 15 mins") / COUNT(member_casual) * 100 AS under_15_mins,
  COUNTIF(ride_duration_cat = "Under 30 mins") / COUNT(member_casual) * 100 AS under_30_mins,
  COUNTIF(ride_duration_cat = "Under 45 mins") / COUNT(member_casual) * 100 AS under_45_mins,
  COUNTIF(ride_duration_cat = "Under 60 mins") / COUNT(member_casual) * 100 AS under_65_mins,
  COUNTIF(ride_duration_cat = "Over an hour") / COUNT(member_casual) * 100 AS over_an_hour
FROM
  divvy.tripdata_v3
GROUP BY
  member_casual


-- rideable type percentage. x = ride type, y = num ride, fill = casual vs member
SELECT
  member_casual,
  COUNTIF(rideable_type = "classic_bike") / COUNT(member_casual) * 100 AS num_classic_bike,
  COUNTIF(rideable_type = "electric_bike") / COUNT(member_casual) * 100 AS num_electric_bike,
  COUNTIF(rideable_type = "docked_bike") / COUNT(member_casual) * 100 AS num_docked_bike,
FROM
  divvy.tripdata_v3
GROUP BY
  member_casual


-- Find usage pattern. total num of rides. casual vs member
-- usage by day, member
SELECT
  EXTRACT(HOUR FROM started_at) AS hour,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "member"
GROUP BY
  hour
ORDER BY
  hour


-- usage by day, casual
SELECT
  EXTRACT(HOUR FROM started_at) AS hour,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "casual"
GROUP BY
  hour
ORDER BY
  hour


-- usage by week, member
-- 1 = Sunday
SELECT
  EXTRACT(DAYOFWEEK FROM started_at) AS weekday,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "member"
GROUP BY
  weekday
ORDER BY
  weekday


-- usage by week, casual
-- 1 = Sunday
SELECT
  EXTRACT(DAYOFWEEK FROM started_at) AS weekday,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "casual"
GROUP BY
  weekday
ORDER BY
  weekday


-- usage by month, member
SELECT
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "member"
GROUP BY
  month
ORDER BY
  month


-- usage by month, casual
SELECT
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(started_at) AS num_ride
FROM
  divvy.tripdata_v3
WHERE
  member_casual = "casual"
GROUP BY
  month
ORDER BY
  month


-- Find top stations (start and end stations), name and lat-long
-- According to month usage, let May to Oct be the peak season


-- peak season member
SELECT
  rideable_type,
  EXTRACT(MONTH FROM started_at) AS month,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  divvy.tripdata_v3
WHERE
  EXTRACT(MONTH FROM started_at) BETWEEN 5 AND 10
AND
  member_casual = "member"


-- peak season casual
SELECT
  rideable_type,
  EXTRACT(MONTH FROM started_at) AS month,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  divvy.tripdata_v3
WHERE
  EXTRACT(MONTH FROM started_at) BETWEEN 5 AND 10
AND
  member_casual = "casual"


-- off season member
SELECT
  rideable_type,
  EXTRACT(MONTH FROM started_at) AS month,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  divvy.tripdata_v3
WHERE
  EXTRACT(MONTH FROM started_at) NOT BETWEEN 5 AND 10
AND
  member_casual = "member"


-- off season casual
SELECT
  rideable_type,
  EXTRACT(MONTH FROM started_at) AS month,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  divvy.tripdata_v3
WHERE
  EXTRACT(MONTH FROM started_at) NOT BETWEEN 5 AND 10
AND
  member_casual = "casual"
