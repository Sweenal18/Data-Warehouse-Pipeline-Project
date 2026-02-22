{{ config(materialized='table') }}

SELECT
    id                              AS user_id,
    address_address,
    address_city,
    address_state,
    address_statecode,
    address_postalcode,
    address_country,
    address_coordinates_lat         AS address_lat,
    address_coordinates_lng         AS address_lng
FROM {{ source('staging', 'users') }}