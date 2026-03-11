drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

create or replace function fnc_persons(pgender varchar default 'female') returns table (
	id person.id%TYPE, 
	name person.name%TYPE, 
	age person.age%TYPE, 
	gender person.gender%TYPE, 
	address person.address%TYPE
) as
	$persons_func$
		select id, name, age, gender, address from person where gender = pgender;
	$persons_func$ language sql;

select * from fnc_persons(pgender := 'male');
select * from fnc_persons();

