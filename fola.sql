create or replace function fola(a numeric, b varchar) returns varchar language plpgsql as $$

declare
r varchar(150)=''; 
begin
for i in 1..a loop
r=r||'ola'||b;
end loop;

return r;
end;$$
