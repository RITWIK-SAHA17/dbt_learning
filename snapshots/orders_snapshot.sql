{% snapshot orders_snapshot %}
    {{config(
        unique_key = 'order_id',
        strategy = 'timestamp',
        updated_at = 'load_date_time'
    )}}

select 
order_id,
customer_id,
order_date,
current_timestamp() as  load_date_time from {{ source('raw','orders')}}

{% endsnapshot %}
