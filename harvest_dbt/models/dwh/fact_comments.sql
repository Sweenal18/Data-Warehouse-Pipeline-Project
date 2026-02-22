{{ config(materialized='table') }}

SELECT
    id          AS comment_id,
    postid      AS post_id,
    user_id,
    body,
    likes,
    loaded_at
FROM {{ source('staging', 'comments') }}
