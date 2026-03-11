create or replace function fnc_fibonacci(pstop integer default 10) returns table(fib_numb integer) as
	$fib_f$
		with recursive fib(a, b) as (
				values(0, 1)
			union all
				select b, a + b from fib where b < pstop)
				select a from fib;
	$fib_f$ language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();


