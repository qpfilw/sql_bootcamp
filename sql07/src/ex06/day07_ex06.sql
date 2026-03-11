select pizzeria.name, buf.count_of_orders, buf.average_price, buf.max_price,
	buf.min_price from (
		select pizzeria_id, count(*) as count_of_orders, round(avg(menu.price), 2) as average_price,
			max(menu.price) as max_price, min(menu.price) as min_price
		from person_order
		left join menu on menu.id = menu_id
		group by menu.pizzeria_id
	) as buf

left join pizzeria on pizzeria.id = buf.pizzeria_id
order by pizzeria.name