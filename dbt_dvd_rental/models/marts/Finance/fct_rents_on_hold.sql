with film as (
    select * from {{ source ('public', 'film')}}
),
payment as (
    select 
        rental_id, 
        amount 
     from {{ source ('public', 'payment')}}
),
rental as (
    select * from {{ source ('public', 'rental')}}
),
inventory as (
    select * from {{ source ('public', 'inventory')}}
),

final as (
    select 
        rental.rental_id as rental_id,
        rental.customer_id as customer_id,
        film.film_id,
        film.replacement_cost as potential_lost,
        CURRENT_DATE  - rental.rental_date::DATE as days_delayed
    from (rental 
    inner join inventory using (inventory_id))
    inner join film using (film_id)
    where rental.return_date is null 
)

select * from final