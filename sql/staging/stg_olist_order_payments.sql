CREATE TABLE staging.stg_olist_order_payments AS
SELECT DISTINCT
    order_id,
    payment_sequential,
    LOWER(TRIM(payment_type))                AS payment_type,
    COALESCE(payment_installments, 0)        AS payment_installments,
    CAST(payment_value AS NUMERIC(10,2))     AS payment_value
FROM raw.order_payments;
