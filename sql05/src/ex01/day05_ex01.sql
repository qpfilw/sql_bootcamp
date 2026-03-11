set enable_seqscan = off;

explain analyze
select pizza_name, pizzeria.name from menu
left join pizzeria on pizzeria_id = pizzeria.id;