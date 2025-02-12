/*
crea un trigger que impida que nun mesmo estadio poda adestrar outro
equipo no mesmo ano.
insert into adestra avlues('e1',2002,'es1')
rexeitada, ese estadio  sa esta ocupado nese ano
insert into xoga values('e1',2004,'es1')
*/

drop trigger if exists t5_ocupaestadio on adestra; 
create or replace function ft_tocupaestadio() returns trigger language plpgsql as $$
declare 

cont integer;

begin
select count(*) into cont from adestra where ano=new.ano and codest=new.codest; 
if(cont>0) then
raise exception 'nonvai';
else
raise notice 'sivai';
end if;
return new;
end; $$;

create trigger t5_ocupaestadio before insert on adestra for each row execute procedure ft_tocupaestadio();
--insert into values in froitas('m3','1',lugo)
