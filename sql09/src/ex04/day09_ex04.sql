create or replace function fnc_persons_female() returns table (
	id person.id%TYPE, 
	name person.name%TYPE, 
	age person.age%TYPE, 
	gender person.gender%TYPE, 
	address person.address%TYPE
) as
	$persons_fem$
		select id, name, age, gender, address from person where gender = 'female';
	$persons_fem$ language sql;

create or replace function fnc_persons_male() returns table (
	id person.id%TYPE, 
	name person.name%TYPE, 
	age person.age%TYPE, 
	gender person.gender%TYPE, 
	address person.address%TYPE
) as
	$persons_male$
		select id, name, age, gender, address from person where gender = 'male';
	$persons_male$ language sql;

SELECT * FROM fnc_persons_male();
/*SELECT * FROM fnc_persons_female();*/
