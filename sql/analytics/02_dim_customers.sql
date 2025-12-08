DROP TABLE IF EXISTS analytics.dim_customers;

CREATE TABLE analytics.dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM staging.stg_olist_customers;
