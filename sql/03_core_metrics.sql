-- 每日核心经营指标
USE city_mobility_sql;
SELECT
    DATE(tpep_pickup_datetime) AS trip_date,
    COUNT(*) AS trip_cnt,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value,
    ROUND(AVG(trip_distance), 2) AS avg_trip_distance
FROM vw_trip_clean
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY trip_date;
