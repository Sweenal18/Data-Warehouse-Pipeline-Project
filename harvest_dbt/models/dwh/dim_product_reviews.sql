{{ config(materialized='table') }}

SELECT
    product_id,
    reviewer_name,
    reviewer_email,
    rating,
    comment,
    date,
    loaded_at
FROM {{ source('staging', 'product_reviews') }}