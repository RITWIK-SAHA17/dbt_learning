{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    total_amount
FROM {{ source('raw', 'orders') }}

{% if is_incremental() %}

WHERE order_date > (
    SELECT MAX(order_date)
    FROM {{ this }}
)

{% endif %}