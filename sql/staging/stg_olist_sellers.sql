CREATE TABLE staging.stg_olist_sellers AS
SELECT DISTINCT
    seller_id,
    seller_zip_code_prefix,
    INITCAP(LOWER(TRIM(seller_city)))  AS seller_city,
    UPPER(TRIM(seller_state))          AS seller_state
FROM raw.sellers;
