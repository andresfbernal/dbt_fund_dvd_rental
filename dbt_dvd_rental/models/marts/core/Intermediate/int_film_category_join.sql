with film as (
    select * from {{ ref ('stg_film')}}
),
film_category as (
    select * from {{ ref ('stg_film_category')}}
),

final as (
    select 
        film.film_id as film_id,
        film_category.category_id as category_id
    from film inner join film_category using (film_id)
)
select * from final