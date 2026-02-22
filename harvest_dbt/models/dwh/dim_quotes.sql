{{ config(materialized='table') }}

SELECT
    id          AS quote_id,
    quote,
    author,
    loaded_at
FROM {{ source('staging', 'quotes') }}