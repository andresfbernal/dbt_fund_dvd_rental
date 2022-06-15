select 
    payment_id, 
    customer_id, 
    staff_id, 
    rental_id, 
    amount as amount_in_dollars, 
    payment_date
from {{ source('public', 'payment') }}

