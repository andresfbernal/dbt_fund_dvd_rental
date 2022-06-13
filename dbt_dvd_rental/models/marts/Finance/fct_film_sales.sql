with film as (
    select * from {{ ref ('stg_film')}}
),
payment as (
    select 
        rental_id, 
        amount 
     from {{ ref ('stg_payment')}}
),
rental as (
    select * from {{ ref ('stg_rental')}}
),
inventory as (
    select * from {{ ref ('stg_inventory')}}
),
film_category as (
    select * from {{ ref ('stg_film_category')}}
),

final as (
    select 
        rental.rental_id as rental_id,
        film.film_id as film_id,
        film_category.category_id as category_id,
        rental.inventory_id as inventory_id,
        rental.customer_id as customer_id,
        rental.staff_id as staff_id,
        rental.rental_date as rental_date,
        rental.return_date as return_date,
        payment.amount as amount
    from (((rental 
    inner join payment using (rental_id)) 
    inner join inventory using (inventory_id))
    inner join film using (film_id))
    left join film_category using (film_id)
)

select * from final