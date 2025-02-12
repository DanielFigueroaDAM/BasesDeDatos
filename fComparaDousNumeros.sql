create or replace function fcomparadousnumeros(c integer, a integer) returns varchar language plpgsql as $$

declare
resultado varchar(50);
begin
if c=a then
  resultado='igual';
else
  resultado='distinto';
end if;

resultado='o numero '|| c || ' e '|| resultado || ' ao numero ' || a;
return resultado;
end;$$
