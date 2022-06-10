with address as (
    select * from {{ source('public', 'address') }}
),
city as (
    SELECT * from {{ source('public', 'city') }}
),
country as (
    SELECT * from {{ source('public', 'country') }}
),

 final as (
    select  
        address.address_id, 
        address.address, 
        coalesce(address.address2, null) as address2, 
        address.district, 
        CONCAT(country.country, ', ', city.city) AS location,
        coalesce(address.postal_code, null) as postal_code, 
        coalesce(address.phone, null) as phone

    from ((address left join city using (city_id)))
        left join country using (country_id)
)
select * from final