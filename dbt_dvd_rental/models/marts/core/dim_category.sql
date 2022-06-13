with film as (
    select * from {{ ref('stg_film') }}
),
film_category as (
    SELECT * from {{ ref('stg_film_category') }}
),
category as (
    SELECT * from {{ ref('stg_category') }}
),

 film_category_detailed as (
    select  
        category.category_id,
        category.name,
        film.film_id,
        film.title
        
    from (film left join film_category
    using (film_id)) 
    left join category using (category_id)
),

final as (
    select 
        category_id,
        name,
        STRING_AGG(title, ', ') AS movies
    from
       film_category_detailed
    group by category_id, name
)
select * from final