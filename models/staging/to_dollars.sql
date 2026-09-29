{{config (materialized = 'table')}}

WITH source AS (
    SELECT *
    FROM {{ source('raw', 'orders') }}
)

SELECT
    order_id,
    product_id,
    {{ cents_to_dollars('total_amount')}} as unit_price_dollars
FROM source