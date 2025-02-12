 -- int_sales_margin.sql
WITH sub AS (
SELECT
    *,
    quantity*purchase_price AS purchase_cost,
from {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product
    USING (sales.products_id , product.products_id)
)
SELECT
    *,
   {{ margin('sub.revenue', 'sub.purchase_cost')}} AS margin,
   {{ margin_percent('sub.margin' , 'sub.revenue') }} AS margin_percent,
from sub