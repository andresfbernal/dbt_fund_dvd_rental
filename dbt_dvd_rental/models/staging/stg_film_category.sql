SELECT 
    film_id, 
    category_id
from {{ source('public', 'film_category')}}
