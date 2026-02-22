{{ config(materialized='table') }}

SELECT
    id          AS todo_id,
    userid      AS user_id,
    todo,
    completed,
    loaded_at
FROM {{ source('staging', 'todos') }}