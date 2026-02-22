{{ config(materialized='table') }}

SELECT
    id                  AS user_id,
    bank_cardexpire     AS cardexpire,
    bank_cardnumber     AS cardnumber,
    bank_cardtype       AS cardtype,
    bank_currency       AS currency,
    bank_iban           AS iban,
    ein,
    ssn,
    crypto_coin,
    crypto_wallet,
    crypto_network
FROM {{ source('staging', 'users') }}