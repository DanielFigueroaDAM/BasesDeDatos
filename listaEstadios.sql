create or replace procedure plistaestadios() language plpgsql as $$
declare 
fila record;
resultado varchar=E'\n';

begin

for fila in (select nomest,codest from estadio) loop
    resultado=resultado||fila.nomest||' '||fila.codest||E'\n';
end loop;

raise notice '%',resultado; 

end;$$ 
