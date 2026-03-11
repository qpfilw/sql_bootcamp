select person.name as name, menu.pizza_name, menu.price, 
	cast(menu.price * (1 - person_discounts.discount / 100) as numeric(9, 0)) as discount_price, 
	pizzeria.name as pizzeria_name from person_order
left join person on person.id = person_order.person_id
left join menu on menu.id = person_order.menu_id
left join pizzeria on pizzeria.id = menu.pizzeria_id
left join person_discounts on person_discounts.person_id = person_order.person_id 
	and person_discounts.pizzeria_id = menu.pizzeria_id
order by name, pizza_name

