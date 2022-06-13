SELECT 
    inventory_id, 
    film_id, 
    store_id
from {{source('public', 'inventory')}}
