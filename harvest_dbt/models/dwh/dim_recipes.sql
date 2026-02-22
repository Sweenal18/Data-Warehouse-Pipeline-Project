{{ config(materialized='table') }}

SELECT
    id                  AS recipe_id,
    userid              AS user_id,
    name,
    cuisine,
    difficulty,
    preptimeminutes,
    cooktimeminutes,
    servings,
    caloriesperserving,
    rating,
    reviewcount,
    mealtype,
    tags,
    ingredients,
    instructions,
    image,
    loaded_at
FROM {{ source('staging', 'recipes') }}