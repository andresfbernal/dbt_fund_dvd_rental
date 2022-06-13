SELECT 
    actor_id, 
    film_id

from {{ source('public', 'film_actor') }}

