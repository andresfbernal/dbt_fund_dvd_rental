with rents as (
    select * from {{ ref('fct_film_sales')}}
),
final as (
    select
        customer_id,
        min(rental_date) as first_rental_date,
        max(rental_date) as most_recent_rental_date,
        count(rental_id) as number_of_rents,
        sum(amount) as lifetime_value
    from rents 
    group by customer_id
)

select * from final