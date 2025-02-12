-- de cada marca mostrar sus productos
create or replace procedure pmarcas(marcas varchar) language plpgsql as $$
declare 
resultado varchar='';
fila record;
codigo varchar;
begin
select codm into codigo from marca where nomm=marcas;
	for fila in select nome from produto where codm=codigo loop
	resultado=resultado||E'\t'||fila.nome||E'\n';
	end loop;

raise notice '%',resultado; 
end;$$ 
