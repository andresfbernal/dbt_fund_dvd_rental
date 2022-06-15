with customer as (
    select * from {{ref('stg_customer')}}
)

select 
    first_name, 
    last_name, 
    email,
    count(*) as duplicates 
from customer
    group by first_name, last_name, email
    having count(*) > 1