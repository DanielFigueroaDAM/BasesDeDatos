create or replace function flistaxogadores() returns varchar language plpgsql as $$

declare
fila record;
resultado varchar='';
begin
for fila in (select codx,nomx,codequ from xogador) loop

resultado=resultado||fila.codx||' '||fila.nomx||' '||fila.codequ||E'\n';

end loop;

return resultado;
end;$$
