-- calcuate margin 
{% macro margin(revenue, purchase_cost) %} 
    round(revenue - purchase_cost) 
{% endmacro %}

-- calcuate margin percent
{% macro margin_percent(margin, revenue) %}
    round(SAFE_DIVIDE({{margin}}, {{revenue}}), 2)
{% endmacro %}