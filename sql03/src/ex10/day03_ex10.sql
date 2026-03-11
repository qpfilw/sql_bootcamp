insert into person_order
values ((select max(person_order.id) + 1 from person_order), 
		(select person.id from person where name = 'Denis'), 
		20, '2022-02-24'),
		((select max(person_order.id) + 2 from person_order), 
		(select person.id from person where name = 'Irina'), 
		20, '2022-02-24')
