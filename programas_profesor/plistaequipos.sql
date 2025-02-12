create or replace procedure plistaequipos() language plpgsql as $$
declare 
fila record;
resultado varchar=E'\n';

begin

for fila in (select codequ, nomequ from equipo) loop
    resultado=resultado||fila.codequ||' '||fila.nomequ||E'\n';
end loop;

raise notice '%',resultado; 

end;$$ 
