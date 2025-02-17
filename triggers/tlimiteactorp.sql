/*impedir que un actor poda traballar  mais de  500 horas  na mesma serie (inserindo)

insert into interpretesser values('a18','p35','s3',1);
'o numero de horas traballadas por este actor nesta serie superaria  as 500 , rexeitada insercion'
insert into interpretesser values('a2','p35','s3',100);
'rexistro inserido'*/
--tlimiteactorp
drop trigger if exists tlimiteactorp on interpretesser; 
create or replace function ft_limiteactorp() returns trigger language plpgsql as $$
declare 

cont integer;

begin
select sum(horas) into cont from interpretesser where cods=new.cods and coda=new.coda;
if(cont>500) then
raise exception 'o numero de horas traballadas por este actor nesta serie superaria  as 500 , rexeitada insercion';
else
raise notice 'rexistro inserido';
end if;
return new;
end; $$;

create trigger tlimiteactorp before insert on interpretesser for each row execute procedure ft_limiteactorp();