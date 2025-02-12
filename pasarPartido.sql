create or replace procedure pasarpartido(estadios text) language plpgsql as $$
declare 
fila record;
filae record;
resultado varchar=E'\n';
begin
for fila in (select codpar,nompar,data,codest from partido where codest=estadios) loop
resultado=resultado||E'\t'||fila.codpar||' '||fila.nompar||' '||fila.data||fila.codest||E'\n';
	end loop;
raise notice '%',resultado; 

end;$$ 
