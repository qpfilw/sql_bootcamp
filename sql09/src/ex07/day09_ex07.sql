create or replace function func_minimum(variadic arr numeric[]) returns numeric as
	$f_min$
		select min(n) from unnest(arr) as n;
	$f_min$ language sql;

select func_minimum(variadic arr => ARRAY[1.0, 0.5, 30.0, 4.0, 6.0])


