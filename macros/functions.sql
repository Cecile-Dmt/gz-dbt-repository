-- calcuate margin 
{% macro margin(revenue, purchase_cost) %} 
    round(revenue - purchase_cost) 
{% endmacro %}

-- calcuate margin percent
{% macro margin_percent(margin, revenue) %}
    round(safe_divide({margin}, {revenue}), 2)
{% endmacro %}