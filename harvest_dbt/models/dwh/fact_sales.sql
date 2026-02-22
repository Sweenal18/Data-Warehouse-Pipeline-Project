{{ config(materialized='table') }}

SELECT
    id              AS cart_id,
    userid          AS user_id,
    total,
    discountedtotal,
    totalproducts,
    totalquantity,
    loaded_at
FROM {{ source('staging', 'carts') }}