-- de cada marca mostrar sus productos
create or replace procedure pmarcasprecio(marcas varchar) language plpgsql as $$
declare 
resultado varchar='';
fila record;
codigo varchar;
cont integer=0;
media integer=0;
begin
select codm into codigo from marca where nomm=marcas;
	for fila in select nome,prezo from produto where codm=codigo loop
	resultado=resultado||E'\t'||fila.nome||' '||fila.prezo||E'\n';
    media=media+fila.prezo;
    cont=cont+1;
	end loop;
    media=media/cont;
raise notice '%',resultado; 
raise notice '%',media;
end;$$ 
