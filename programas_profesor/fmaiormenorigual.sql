/*
facer una funcion chamada fmaiormenorigual tal que pasandolle dous numeros (a, b) imprima unha mensaxe que sera:
'primeiro numero maior que o segundo'
'primeiro numero menos que o segundo'
'primeiro numero igual ao segundo'
nota : para  comparar valores facemos así
if a>b then....   si a e maior que b 
if a<b then....  si a e menor que b 
if a=b then....  si a e igual que b 
*/
create or replace function fmaiormenorigual(c integer,a integer) returns varchar language plpgsql as $$
declare
resultado varchar(50);
begin
if c>a then
    resultado= c||' maior que '||a;
elsif c<a then 
     resultado= c||' menor que '||a;
else 
     resultado= c||' igual a '||a;
end if;

return resultado;
end;$$








