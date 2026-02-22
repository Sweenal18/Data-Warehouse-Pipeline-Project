{{ config(materialized='table') }}

SELECT
    id                  AS post_id,
    userid              AS user_id,
    title,
    body,
    tags,
    views,
    reactions_likes,
    reactions_dislikes,
    loaded_at
FROM {{ source('staging', 'posts') }}