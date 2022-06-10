with address as (
    select * from {{ source('public', 'address') }}
),
city as (
    SELECT * from {{ source('public', 'city') }}
),
country as (
    SELECT * from {{ source('public', 'country') }}
),
store as (
    SELECT * from {{ source('public', 'store') }}
),
staff as (
    SELECT * from {{ ref('stg_staff') }}
),

 final as (
    select  
        store.store_id, 
        address.address_id, 
        address.address, 
        address.district, 
        CONCAT(country.country, ', ', city.city) AS location,
        staff.fullname AS manager

    from ((((address inner join city using (city_id)))
        inner join country using (country_id))
        inner join store using (address_id))
        inner join staff on (store.manager_staff_id = staff.staff_id)
)
select * from final