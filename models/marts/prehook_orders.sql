{{
    config(
        materialized='table',
        pre_hook=[ "create or replace temporary table db.dbt_first.temp_orders as select * from db.raw_schema.orders"]
    )
}}

with cte as (
    select * from db.dbt_first.temp_orders
)
select * from cte 