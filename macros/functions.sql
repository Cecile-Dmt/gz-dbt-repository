-- calcuate margin 
{% macro margin(revenue, purchase_cost) %}
     ROUND(revenue - purchase_cost)
 {% endmacro %}

-- calcuate margin percent
{% macro margin_percent(margin, revenue) %}
    ROUND(SAFE_DIVIDE({margin}, {revenue}),2)
 {% endmacro %}
