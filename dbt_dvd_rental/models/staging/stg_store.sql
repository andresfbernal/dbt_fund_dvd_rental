SELECT 
    store_id, 
    manager_staff_id, 
    address_id

from {{source('public', 'store')}}

