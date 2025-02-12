-- facer unha funcion tal que pasandolle dous numeros (a,b) 
-- imprima unha mensaxe que será:
-- primeiro numero maior que o segundo
-- primero numero menor que o segundo
-- primeiro numero igual que ao segundo
create or replace function fmayormenoroigual(c integer, a integer) returns varchar language plpgsql as $$

declare
resultado varchar(55);
begin
if c>a then
  resultado='O primeiro numero es mayor';
elsif a>c then
  resultado='O primeiro numero es menor';
else
  resultado='O primeiro numero es igual';
end if;
return resultado;
end;$$
