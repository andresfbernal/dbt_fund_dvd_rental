with rents as (
    select * from {{ ref('stg_rental')}}
),
customer as (
    select * from {{ ref('stg_customer')}}
),
payment as (
    select * from {{ ref('stg_payment')}}
),
final as (
    select
        rents.customer_id,
        min(rental_date) as first_rental_date,
        max(rental_date) as most_recent_rental_date,
        count(rental_id) as number_of_rents,
        sum(amount) as lifetime_value
    from (rents left join payment using (rental_id))
    left join customer on (rents.customer_id = customer.customer_id)
    group by rents.customer_id
)

select * from final