--funcion que devolta o salario dun xogador a partir do seu codigo
create or replace function fsalario(vcodx varchar) returns varchar language plpgsql as $$
declare
p record;
resultado varchar;
begin

select * into p from xogador where codx=vcodx;
resultado=p;
return resultado;
end;$$
