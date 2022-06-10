with actor as (
    select 
        actor_id, 
        first_name,
        last_name
    from {{ source('public', 'actor') }}
)

select * from actor
