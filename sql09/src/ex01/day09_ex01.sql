create or replace function fnc_trg_person_update_audit() returns trigger as
$person_audit$
	begin
		insert into person_audit(type_event, row_id, name, age, gender, address)
		values('U', old.id, old.name, old.age, old.gender, old.address);
		return old;
	end;
$person_audit$ language plpgsql;

create or replace trigger trg_person_update_audit
	after update on person
	for each row execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

select * from person_audit