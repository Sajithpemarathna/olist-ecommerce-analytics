DROP TABLE IF EXISTS analytics.dim_date;

CREATE TABLE analytics.dim_date AS
SELECT DISTINCT
    order_purchase_ts::date                        AS date_id,
    EXTRACT(YEAR FROM order_purchase_ts)           AS year,
    EXTRACT(MONTH FROM order_purchase_ts)          AS month,
    EXTRACT(DAY FROM order_purchase_ts)            AS day,
    EXTRACT(DOW FROM order_purchase_ts)            AS day_of_week,
    TO_CHAR(order_purchase_ts, 'Day')              AS day_name,
    TO_CHAR(order_purchase_ts, 'Month')            AS month_name,
    CASE 
        WHEN EXTRACT(DOW FROM order_purchase_ts) IN (0,6) THEN 'Weekend'
        ELSE 'Weekday'
    END                                            AS day_type
FROM staging.stg_olist_orders;

SELECT COUNT(*) FROM analytics.dim_date;
