with customers as (
    select * from {{ ref ('stg_customer')}}
),
customer_rentals_grouped as (
    select * from {{ ref('int_customer_rentals_grouped')}}
),
final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customers.email,
        customers.status,
        customers.create_date,
        customer_rentals_grouped.first_rental_date,
        customer_rentals_grouped.most_recent_rental_date,
        coalesce(customer_rentals_grouped.number_of_rents, 0) as number_of_rents,
        customer_rentals_grouped.lifetime_value
    from customers
    left join customer_rentals_grouped using (customer_id)
)
select * from final