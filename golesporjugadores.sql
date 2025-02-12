create or replace procedure holesporjugadores() as $$
declare
resultado varchar =E'\n'; -- sin terminar
noestan varchar =E'\n';
fila record;
suma integer;
nost text;
begin
for fila in (select nomx,codx from xogador) loop
	select codx into nost from xogador where fila.codx  not in (select fila.codx from xoga);
	noestan=noestan||nost||E'\n';

end loop;
raise notice '%', noestan;

end;$$  language plpgsql 

