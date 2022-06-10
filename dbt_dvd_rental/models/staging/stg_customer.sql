SELECT 
    customer_id, 
    store_id, 
    first_name, 
    last_name, 
    email, 
    address_id, 
    CASE
        WHEN active = 1 THEN 'active'
        ELSE 'inactive'
    END as status,
    create_date
from {{ source('public', 'customer') }}

