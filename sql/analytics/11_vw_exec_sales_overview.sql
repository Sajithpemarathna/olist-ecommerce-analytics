CREATE OR REPLACE VIEW analytics.vw_exec_sales_overview AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    -- Date dimension key
    d.date_id,

    o.items_count,
    o.items_total_price AS revenue,
    o.freight_total AS freight_cost,

    -- Delivery days
    (o.delivered_customer_ts - o.order_purchase_ts) AS delivery_time_days,

    -- Estimated delivery days
    (o.estimated_delivery_ts - o.order_purchase_ts) AS estimated_delivery_days,

    -- Late delivery (1 = late)
    CASE
        WHEN (o.delivered_customer_ts - o.order_purchase_ts) >
             (o.estimated_delivery_ts - o.order_purchase_ts)
        THEN 1 ELSE 0
    END AS is_late_delivery

FROM analytics.fct_orders o
JOIN analytics.dim_customers c 
    ON o.customer_id = c.customer_id
JOIN analytics.dim_date d 
    ON d.date_id = o.order_purchase_ts;   -- match date_id to purchase date
