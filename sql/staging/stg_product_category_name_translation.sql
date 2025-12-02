CREATE TABLE staging.stg_product_category_name_translation AS
SELECT DISTINCT
    LOWER(TRIM(product_category_name))            AS product_category_name,
    INITCAP(LOWER(TRIM(product_category_name_english)))
                                                  AS product_category_name_english
FROM raw.product_category_name_translation;
