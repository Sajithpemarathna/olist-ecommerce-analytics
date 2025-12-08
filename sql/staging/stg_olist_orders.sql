CREATE TABLE staging.stg_olist_orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    LOWER(TRIM(order_status))                    AS order_status,
    order_purchase_timestamp::timestamp          AS order_purchase_ts,
    order_approved_at::timestamp                 AS order_approved_ts,
    order_delivered_carrier_date::timestamp      AS delivered_carrier_ts,
    order_delivered_customer_date::timestamp     AS delivered_customer_ts,
    order_estimated_delivery_date::timestamp     AS estimated_delivery_ts,
    -- Simple derived metric: days from purchase to delivery
    (order_delivered_customer_date::date
        - order_purchase_timestamp::date)        AS delivery_days
FROM raw.orders;
