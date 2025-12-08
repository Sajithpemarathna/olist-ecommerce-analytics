-- Drop table if it already exists (for reruns)
DROP TABLE IF EXISTS analytics.dim_products;

CREATE TABLE analytics.dim_products AS
SELECT DISTINCT
    p.product_id,
    p.product_category_name,
    t.product_category_name_english,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM staging.stg_olist_products p
LEFT JOIN staging.stg_product_category_name_translation t
       ON p.product_category_name = t.product_category_name;
