with actor as (
    select 
    staff_id, 
    CONCAT(first_name, ' ', last_name) AS fullname,
    address_id, 
    email, 
    store_id, 
    active, 
    username, 
    "password", 
    last_update, 
    picture
    from {{ source('public', 'staff') }}
)

select * from actor
