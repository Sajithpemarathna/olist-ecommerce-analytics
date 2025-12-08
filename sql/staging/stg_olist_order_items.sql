CREATE TABLE staging.stg_olist_order_items AS
SELECT DISTINCT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date::timestamp        AS shipping_limit_ts,
    CAST(price AS NUMERIC(10,2))         AS item_price,
    CAST(freight_value AS NUMERIC(10,2)) AS freight_value
FROM raw.order_items;
