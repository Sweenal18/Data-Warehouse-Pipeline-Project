{{ config(materialized='table') }}

SELECT
    cart_id,
    product_id,
    title,
    price,
    quantity,
    total,
    discountpercentage,
    discountedtotal,
    loaded_at
FROM {{ source('staging', 'cart_items') }}