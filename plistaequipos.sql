create or replace procedure plistaequipos() as $$
declare
fila record;
resultado varchar=E'\n';
begin
for fila in (select nomequ,codequ from equipo) loop

resultado=resultado||fila.codequ||' '||fila.nomequ||E'\n';

end loop;
raise notice '%',resultado;
end;$$  language plpgsql 
