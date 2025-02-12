create or replace procedure plistapartidosestadios() language plpgsql as $$
declare 
fila record;
filae record;
resultado varchar=E'\n';

begin
for filae in(select codest,nomest from estadio) loop
    	resultado=resultado||filae.codest||' '||filae.nomest||E'\n';
	for fila in (select codpar,nompar,data,codest from partido where codest=filae.codest) loop
	resultado=resultado||E'\t'||fila.codpar||' '||fila.nompar||' '||fila.data||fila.codest||E'\n';
	end loop;
end loop;
raise notice '%',resultado; 

end;$$ 
