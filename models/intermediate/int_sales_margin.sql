 -- int_sales_margin.sql
  SELECT
      products_id,
      date_date,
      orders_id,
      revenue,
      quantity,
      purchase_price,
      ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
      ROUND(s.revenue - s.quantity*p.purchase_price, 2) AS margin,
      {{margin_percent('s.revenue', 's.quantity' * CAST(p.purchase_price AS FLOAT64))}} AS margin_percent
      ROUND((SAFE_DIVIDE(s.revenue - p.purchase_cost), s.revenue) , 2)
     --{{ margin('revenue', 'purchase_cost')}} AS margin,
     --{{ margin_percent('margin' , 'revenue') }} AS margin_percent,
  FROM {{ref("stg_raw__sales")}} s
  LEFT JOIN {{ref("stg_raw__product")}} p
    ON s.pdt_id = p.products_id