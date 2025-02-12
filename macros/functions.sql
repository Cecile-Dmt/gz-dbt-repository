-- calcuate margin 
--{% macro margin(revenue, purchase_cost) %} 
    round({{revenue}} - {{purchase_cost}}) 
--{% endmacro %}

-- calcuate margin percent
--{% macro margin_percent(margin, revenue) %}
    --round(SAFE_DIVIDE({{margin}}, {{revenue}}), 2)
--{% endmacro %}

-- calcuate margin percent
{% macro margin_percent(revenue, purchase_cost, precision=2) %}
    round(SAFE_DIVIDE({{revenue}} - {{purchase_cost}}), {{precision}})
{% endmacro %}