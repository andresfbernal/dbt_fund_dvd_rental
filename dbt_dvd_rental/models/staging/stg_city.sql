SELECT 
    city_id, 
    city, 
    country_id
FROM {{ source('public', 'city') }}
