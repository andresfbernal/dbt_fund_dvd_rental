SELECT 
    category_id, 
    "name"
from {{ source('public', 'category') }}

