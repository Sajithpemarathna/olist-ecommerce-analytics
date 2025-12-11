CREATE OR REPLACE VIEW analytics.vw_seller_delivery_performance AS
SELECT
    o.order_id,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,

    oi.item_price AS revenue,

    -- seller info comes from order_items
    oi.seller_id,
    s.seller_city,
    s.seller_state,

    o.order_purchase_ts,
    o.delivered_customer_ts,
    o.estimated_delivery_ts,

    -- Delivery days
    (o.delivered_customer_ts - o.order_purchase_ts) AS delivery_time_days,

    -- Estimated delivery days
    (o.estimated_delivery_ts - o.order_purchase_ts) AS estimated_delivery_days,

    -- Late delivery flag
    CASE
        WHEN (o.delivered_customer_ts - o.order_purchase_ts) >
             (o.estimated_delivery_ts - o.order_purchase_ts)
        THEN 1 ELSE 0
    END AS is_late_delivery

FROM analytics.fct_orders o
JOIN analytics.fct_order_items oi 
    ON o.order_id = oi.order_id
JOIN analytics.dim_products p 
    ON oi.product_id = p.product_id
JOIN analytics.dim_sellers s 
    ON oi.seller_id = s.seller_id;
