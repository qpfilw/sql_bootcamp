with np as (
	select * from menu
	left join person_order on menu.id = person_order.menu_id
	where person_order.menu_id is null
)
select np.pizza_name, np.price, pizzeria.name as pizzeria_name from np
join pizzeria on np.pizzeria_id = pizzeria.id
order by np.pizza_name, np.price