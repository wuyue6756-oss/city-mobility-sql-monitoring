USE city_mobility_sql;

WITH daily_revenue AS (
    SELECT
        DATE(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS trip_cnt,
        SUM(total_amount) AS total_revenue
    FROM vw_trip_clean
    GROUP BY DATE(tpep_pickup_datetime)
),
stats AS (
    SELECT
        AVG(total_revenue) AS avg_revenue,
        STDDEV_SAMP(total_revenue) AS std_revenue
    FROM daily_revenue
)
SELECT
    d.trip_date,
    d.trip_cnt,
    ROUND(d.total_revenue, 2) AS total_revenue,
    ROUND(s.avg_revenue, 2) AS avg_revenue,
    ROUND(s.std_revenue, 2) AS std_revenue,
    ROUND((d.total_revenue - s.avg_revenue) / s.std_revenue, 2) AS z_score
FROM daily_revenue d
CROSS JOIN stats s
WHERE (d.total_revenue - s.avg_revenue) / s.std_revenue >= 1.5
ORDER BY z_score DESC;
