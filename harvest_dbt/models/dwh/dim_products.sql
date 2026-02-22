{{ config(materialized='table') }}

SELECT
    id                      AS product_id,
    title,
    category,
    brand,
    price,
    discountpercentage,
    rating,
    stock,
    availabilitystatus,
    sku,
    thumbnail
FROM {{ source('staging', 'products') }}