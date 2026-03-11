create or replace function fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', 
			pprice numeric default 500, pdate date default '2022-01-08') returns table (
					name pizzeria.name%TYPE
) as
	$person_visits$
		begin
			return query
				select pizzeria.name from menu 
					join pizzeria on pizzeria.id = menu.pizzeria_id
					join person_visits on person_visits.pizzeria_id = menu.pizzeria_id
					join person on person.id = person_visits.person_id 
				where menu.price < pprice and person.name = pperson and person_visits.visit_date = pdate;
		end;
	$person_visits$ language plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);
/*select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');*/


