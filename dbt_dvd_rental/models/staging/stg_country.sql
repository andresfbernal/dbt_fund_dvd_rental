SELECT country_id, country
from {{ source('public', 'country') }}

