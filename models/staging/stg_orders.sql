select
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit,
    o.ordersellingprice,
    o.ordercostprice,
    -- from raw customer
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    -- from raw product
    p.productid,
    p.category,
    p.productname,
    p.subcategory

from {{ ref("raw_orders") }} o
left join {{ ref("raw_customer") }} c on o.customerid = c.customerid
left join {{ ref("raw_product") }} p on o.productid = p.productid
