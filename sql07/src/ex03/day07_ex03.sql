select total1.name, coalesce(total1.count, 0) + 
	coalesce(total2.count, 0) as total_count
from (
	select pizzeria.name, count(*) from person_visits
    join pizzeria on pizzeria.id = person_visits.pizzeria_id
    group by pizzeria.name
    order by 2 desc) as total1

	full join
	
    (select pizzeria.name, count(*) from person_order
      join menu on menu.id = person_order.menu_id
      join pizzeria on pizzeria.id = menu.pizzeria_id
      group by pizzeria.name
      order by 2 desc) as total2 on total1.name = total2.name
order by 2 desc, 1 asc