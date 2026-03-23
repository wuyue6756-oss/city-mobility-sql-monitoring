-- 清洗后视图：去掉明显异常值
CREATE VIEW vw_trip_clean AS
SELECT *
FROM fact_trip
WHERE trip_distance > 0
  AND total_amount > 0
  AND fare_amount >= 0
  AND PULocationID IS NOT NULL
  AND DOLocationID IS NOT NULL
  AND tpep_pickup_datetime IS NOT NULL
  AND tpep_dropoff_datetime IS NOT NULL;
  AND tpep_pickup_datetime >= '2025-11-01'
  AND tpep_pickup_datetime < '2025-12-01';
