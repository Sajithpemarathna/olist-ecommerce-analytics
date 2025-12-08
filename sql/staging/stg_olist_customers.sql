
-- 1) Drop & recreate so the script is repeatable
DROP TABLE IF EXISTS staging.stg_olist_customers;

CREATE TABLE staging.stg_olist_customers AS
SELECT
    DISTINCT                        -- defensive: avoid accidental duplicates
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    -- Clean city/state for consistency
    LOWER(TRIM(customer_city))  AS customer_city,
    UPPER(TRIM(customer_state)) AS customer_state
FROM raw.olist_customers_dataset;
