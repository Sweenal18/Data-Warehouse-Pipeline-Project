{{ config(materialized='table') }}

SELECT
    id                          AS user_id,
    maidenname,
    image,
    bloodgroup,
    height,
    weight,
    eyecolor,
    hair_color,
    hair_type,
    ip,
    macaddress,
    useragent,
    university
FROM {{ source('staging', 'users') }}