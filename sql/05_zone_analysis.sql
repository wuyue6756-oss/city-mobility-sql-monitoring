-- 上车区域收入 Top 10
SELECT
    z.Borough,
    z.Zone,
    COUNT(*) AS trip_cnt,
    ROUND(SUM(f.total_amount), 2) AS total_revenue,
    ROUND(AVG(f.total_amount), 2) AS avg_order_value
FROM vw_trip_clean f
LEFT JOIN dim_zone z
    ON f.PULocationID = z.LocationID
GROUP BY z.Borough, z.Zone
ORDER BY total_revenue DESC
LIMIT 10;