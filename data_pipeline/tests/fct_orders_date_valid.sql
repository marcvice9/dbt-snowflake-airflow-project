select
    *
from 
    {{ ref('fct_orders') }}
where
    order_date > CURRENT_DATE()
    OR DATE(order_date) < DATE('1990-01-01')