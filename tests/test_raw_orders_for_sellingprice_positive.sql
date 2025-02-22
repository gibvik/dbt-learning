select
  orderid,
  ordersellingprice as sellingprice
from {{ ref('raw_orders') }}
where ordersellingprice < 0