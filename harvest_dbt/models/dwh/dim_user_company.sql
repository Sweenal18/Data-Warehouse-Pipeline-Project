{{ config(materialized='table') }}

SELECT
    id                                  AS user_id,
    company_name,
    company_department,
    company_title,
    company_address_address,
    company_address_city,
    company_address_state,
    company_address_statecode,
    company_address_postalcode,
    company_address_country,
    company_address_coordinates_lat     AS company_address_lat,
    company_address_coordinates_lng     AS company_address_lng
FROM {{ source('staging', 'users') }}