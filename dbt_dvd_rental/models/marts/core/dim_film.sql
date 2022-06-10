with film as (
    select * from {{ source('public', 'film') }}
),
actor as (
    SELECT * from {{ ref('stg_actor') }}
),
film_actor as (
    SELECT * from {{ source('public', 'film_actor') }}
),
language as (
    SELECT * from {{ source('public', 'language') }}
),

actors_per_film as (
    select  
        film.film_id,
        STRING_AGG(fullname, ', ') AS actors
    from (film inner join film_actor
    using (film_id)) 
    inner join actor using (actor_id)
    group by film_id
),
languages_film as (
    select  
        film.film_id,
        STRING_AGG(name, ', ') AS languages
    from film inner join language
    using (language_id)
    group by film_id
),

final as (
    select 
        film.film_id, 
        title, 
        description, 
        actors, 
        release_year, 
        languages, 
        length, 
        replacement_cost, 
        rating, 
        special_features, 
        fulltext
    from
       (film inner join actors_per_film using (film_id))
       inner join languages_film using (film_id)
)
select * from final