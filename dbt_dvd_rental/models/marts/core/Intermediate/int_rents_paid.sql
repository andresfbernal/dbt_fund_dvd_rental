with payment as (
    select 
        *
     from {{ ref ('stg_payment')}}
),

rental as (
    select * from {{ ref ('stg_rental')}}
),
final as (
    select  
        rental.rental_id,
        rental_date, 
        return_date, 
        payment_date, 
        amount_in_dollars, 
        inventory_id,
        rental.customer_id as customer_id,
        rental.staff_id as staff_id
    from rental inner join payment using (rental_id)
)
select * from final