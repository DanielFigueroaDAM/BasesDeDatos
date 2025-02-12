drop trigger if exists t1_salariomin on xogador; 
create or replace function ft1_salariomin() returns trigger language plpgsql as $$
declare 

salariominactual integer;


begin
select avg(salario) into salariominactual from xogador where codequ=new.codequ;

if new.salario<salariominactual then
	raise exception 'rexietada insercion';
else
	raise notice 'aceptada insercion';
end if;
return new;
end; $$;

create trigger t1_salariomin before insert on xogador for each row execute procedure ft1_salariomin();
