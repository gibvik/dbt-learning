select 
--from raw order
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--from raw product
p.productid,
p.category,
p.productname, 
p.subcategory,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on p.productid = o.productid