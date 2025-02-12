create or replace function flistaequipos() returns varchar language plpgsql as $$

declare
fila record;
resultado varchar='';
begin
for fila in (select nomequ,codequ from equipo) loop

resultado=resultado||fila.codequ||' '||fila.nomequ||E'\n';

end loop;

return resultado;
end;$$
