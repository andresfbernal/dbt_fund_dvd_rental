with actor as (
    select 
        actor_id, CONCAT(first_name, ' ', last_name) AS fullname
    from {{ source('public', 'actor') }}
)

select * from actor
