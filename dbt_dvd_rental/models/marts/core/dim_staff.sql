with staff as (
    select * from {{ ref('stg_staff') }}
),

final as (
    select 
    staff_id, 
    fullname, 
    address_id, 
    email, 
    store_id, 
    active, 
    picture
    from
       staff
)
select * from final