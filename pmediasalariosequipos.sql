create or replace procedure pmediasalariosequipos() as $$
declare
resultado varchar =E'\n';
fila record;
media integer;
begin
for fila in select codequ,nomequ from equipo loop
	select avg(salario) into media from xogador where codequ=fila.codequ;
	if media is null then
	resultado = resultado||'el equipo'||fila.nomequ||' sin xogadores'||E'\n';
	else
	resultado = resultado||fila.nomequ||' '||media||E'\n';
	end if;
end loop;
raise notice '%', resultado;

end;$$  language plpgsql 
