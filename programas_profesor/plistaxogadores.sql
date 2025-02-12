create or replace procedure plistaxogadores() language plpgsql as $$
declare 
fila record;
resultado varchar=E'\n';

begin
for fila in (select * from xogador) loop
resultado=resultado||coalesce(fila.codx,'sen codigo')||' '||fila.nomx||' '||coalesce(fila.codequ,' sen equipo ')||' '||coalesce(fila.salario::TEXT,' sen salario')||E'\n';
end loop;

raise notice '%',resultado; 
end;$$
