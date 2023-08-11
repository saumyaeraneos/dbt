select 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice,
--from raw customer
c.customername,
c.segment,
c.country,
-- from raw product
p.category,
p.productname,
p.subcategory
from 
{{ ref('raw_orders') }} o
left join {{ ref('raw_customer') }} r
on o.customerid = r.customerid
left join {{ ref('raw_product') }} product
on o.productid = p.productid
