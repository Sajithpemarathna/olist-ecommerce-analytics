DROP TABLE IF EXISTS analytics.fct_orders;

CREATE TABLE analytics.fct_orders AS
SELECT
    -- keys
    o.order_id,
    o.customer_id,

    -- customer attributes
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    -- dates / timestamps  (kept with your column names)
    o.order_purchase_ts::date      AS order_purchase_ts,
    o.order_approved_ts::date      AS order_approved_ts,
    o.delivered_carrier_ts::date   AS delivered_carrier_ts,
    o.delivered_customer_ts::date  AS delivered_customer_ts,
    o.estimated_delivery_ts::date  AS estimated_delivery_ts,

    -- order status
    o.order_status,

    -- item-level metrics
    COUNT(DISTINCT oi.order_item_id)              AS items_count,
    SUM(oi.item_price)                                 AS items_total_price,
    SUM(oi.freight_value)                         AS freight_total,
    SUM(oi.item_price + oi.freight_value)              AS gross_order_value,

    -- payment metrics
    COUNT(DISTINCT op.payment_sequential)         AS payments_count,
    SUM(op.payment_value)                         AS total_payment_value
FROM staging.stg_olist_orders o
LEFT JOIN staging.stg_olist_customers      c  ON o.customer_id = c.customer_id
LEFT JOIN staging.stg_olist_order_items    oi ON o.order_id    = oi.order_id
LEFT JOIN staging.stg_olist_order_payments op ON o.order_id    = op.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    o.order_purchase_ts,
    o.order_approved_ts,
    o.delivered_carrier_ts,
    o.delivered_customer_ts,
    o.estimated_delivery_ts,
    o.order_status;

-- ✅ Validation check
SELECT COUNT(*) FROM analytics.fct_orders;
