drop trigger if exists t1_salariomax on xogador; 
create or replace function ft1_salariomax() returns trigger language plpgsql as $$
declare 

salariomaximoactual integer;


begin
select max(salario) into salariomaximoactual from xogador where codequ=new.codequ;

if new.salario>salariomaximoactual then
	raise exception 'rexietada insercion';
else
	raise notice 'aceptada insercion';
end if;
return new;
end; $$;

create trigger t1_salariomax before insert on xogador for each row execute procedure ft1_salariomax();
