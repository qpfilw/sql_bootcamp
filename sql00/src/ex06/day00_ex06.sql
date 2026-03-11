select 
    (select name from person where person.id = person_order.person_id),
	(select case when name = 'Denis' then true else false end as check_name from person where person.id = person_order.person_id)
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18) AND order_date = '2022-01-07'
