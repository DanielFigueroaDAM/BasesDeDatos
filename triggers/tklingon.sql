/*impedir inserir un klingon se xa está en humanos ou en vulcanos
insert into klingon values ('p1',null,'pla1'); --->rexeitada, este persoaxe xa está en humanos
insert into klingon values ('p2',null,'pla1');--->rexeitada, este persoaxe xa está en vulcanos
insert into klingon values ('p5',null,'pla1');--->aceptada insercion */

drop trigger if exists tklingon on klingon; 
create or replace function ft_klingon() returns trigger language plpgsql as $$
declare 

conth integer;
contv integer;
begin
select count(*) into conth from humanos where codper=new.codper;
select count(*) into contv from vulcanos where codper=new.codper;
if(conth>=1) then
raise exception 'rexeitada, este persoaxe xa está en humanos';
elsif (contv>=1) then
raise exception 'rexeitada, este persoaxe xa está en vulcan os';
else
raise notice 'sivai';
end if;
return new;
end; $$;

create trigger tklingon before insert on klingon for each row execute procedure ft_klingon();
