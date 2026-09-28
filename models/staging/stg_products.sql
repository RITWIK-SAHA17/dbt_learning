WITH source AS (
    SELECT *
    FROM {{ source('raw', 'products') }}
)

SELECT
    product_id,
    product_name,
    category,
    price,
    stock_quantity
FROM source