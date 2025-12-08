DROP TABLE IF EXISTS analytics.fct_order_items;

CREATE TABLE analytics.fct_order_items AS
SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.item_price,
    oi.freight_value,
    (oi.item_price + oi.freight_value) AS gross_item_value
FROM staging.stg_olist_order_items oi;
