WITH source AS (
    SELECT *
    FROM {{ source('raw', 'customers') }}
)

SELECT
    customer_id,
    customer_name,
    email,
    city,
    signup_date
FROM source