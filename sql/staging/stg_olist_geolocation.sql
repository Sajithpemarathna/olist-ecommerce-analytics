CREATE TABLE staging.stg_olist_geolocation AS
SELECT DISTINCT
    geolocation_zip_code_prefix,
    CAST(geolocation_lat AS NUMERIC(9,6)) AS latitude,
    CAST(geolocation_lng AS NUMERIC(9,6)) AS longitude,
    INITCAP(LOWER(TRIM(geolocation_city)))  AS city,
    UPPER(TRIM(geolocation_state))          AS state
FROM raw.geolocation;
