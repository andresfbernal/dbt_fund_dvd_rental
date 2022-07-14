{{ config(
    materialized='incremental'
) }}

with rents_paid as (
    select *
     from {{ ref ('int_rents_paid')}}
    {% if is_incremental()%}
        where rental_id not in (select rental_id from {{ this }})
    {% endif%}
),

film_category as (
    select * from {{ ref ('int_film_category_join')}}
), 

inventory as (
    select * from {{ ref ('stg_inventory')}}
),

final as (
    select 
        rents_paid.rental_id as rental_id,
        film_category.film_id as film_id,
        film_category.category_id as category_id,
        rents_paid.inventory_id as inventory_id,
        rents_paid.customer_id as customer_id,
        rents_paid.staff_id as staff_id,
        rents_paid.rental_date as rental_date,
        rents_paid.return_date as return_date,
        rents_paid.amount_in_dollars
    from (rents_paid 
            inner join inventory using (inventory_id))
            left join film_category using (film_id)
)

select * from final