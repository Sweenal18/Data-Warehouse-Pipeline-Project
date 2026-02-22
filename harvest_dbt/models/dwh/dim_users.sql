{{ config(materialized='table') }}

SELECT
    id                              AS user_id,
    firstname,
    lastname,
    email,
    phone,
    username,
    age,
    gender,
    birthdate,
    role
FROM {{ source('staging', 'users') }}