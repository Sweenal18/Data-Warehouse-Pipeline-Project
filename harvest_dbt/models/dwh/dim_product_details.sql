{{ config(materialized='table') }}

SELECT
    id                      AS product_id,
    description,
    tags,
    images,
    weight,
    dimensions_width,
    dimensions_height,
    dimensions_depth,
    warrantyinformation,
    shippinginformation,
    returnpolicy,
    minimumorderquantity,
    meta_createdat,
    meta_updatedat,
    meta_barcode,
    meta_qrcode
FROM {{ source('staging', 'products') }}