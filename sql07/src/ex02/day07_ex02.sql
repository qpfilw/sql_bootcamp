select name, count, action_type from (
	(select pizzeria_id, count(*) as count, 'order' as action_type from person_order
	left join menu on menu.id = person_order.menu_id
	group by menu.pizzeria_id
	order by count desc limit 3)

	union 

	(select pizzeria_id, count(*) as count, 'visit' as action_type from person_visits
	group by pizzeria_id
	order by count desc limit 3)) as buf

left join pizzeria on pizzeria.id = buf.pizzeria_id
order by action_type, count desc