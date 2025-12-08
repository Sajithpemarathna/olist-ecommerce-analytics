CREATE TABLE staging.stg_olist_order_reviews AS
SELECT DISTINCT
    review_id,
    order_id,
    review_score,
    NULLIF(TRIM(review_comment_title), '')    AS review_comment_title,
    NULLIF(TRIM(review_comment_message), '')  AS review_comment_message,
    review_creation_date::timestamp           AS review_creation_ts,
    review_answer_timestamp::timestamp        AS review_answer_ts
FROM raw.order_reviews;
