DROP TABLE IF EXISTS analytics.dim_sellers;

CREATE TABLE analytics.dim_sellers AS
SELECT DISTINCT
    s.seller_id,
    s.seller_city,
    s.seller_state
FROM staging.stg_olist_sellers s;
