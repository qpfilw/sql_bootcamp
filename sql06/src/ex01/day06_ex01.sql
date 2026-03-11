with count_orders as (
	select person_order.person_id, menu.pizzeria_id, count(*) as counts from person_order
	left join menu on person_order.menu_id = menu.id
	group by person_order.person_id, menu.pizzeria_id
)

insert into person_discounts
select row_number() over (), count_orders.person_id, count_orders.pizzeria_id,
	case 
		when count_orders.counts = 1 then 10.5
		when count_orders.counts = 2 then 22
		else 30
	end
from count_orders