drop trigger if exists tconservafroita on froitas; 
create or replace function ft_tconservafroita() returns trigger language plpgsql as $$
declare 

cont integer;

begin
select count(*) into cont from conservas where codm=new.codm and n=new.n;
if(cont>=1) then
raise exception 'nonvai';
else
raise notice 'sivai';
end if;
return new;
end; $$;

create trigger tconservafroita before insert on froitas for each row execute procedure ft_tconservafroita();
--insert into values in froitas('m3','1',lugo)
