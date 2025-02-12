-- de cada marca mostrar sus productos
create or replace procedure pmarcaproducto(marca varchar) language plpgsql as $$
declare 
resultado varchar := E'\n';
fila record;
codigo varchar;
begin
select codm into codigo from produto where nome=marca;
	for fila in (select nome from produto where codm=codigo) loop
	resultado=resultado||E'\t'||fila.nome||E'\n';
	end loop;

raise notice '%',resultado; 
end;$$ 
