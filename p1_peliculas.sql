/*
crear procedemento chamado p1_peliculas que amose os titulos de toda as peliculas existentes
*/
CREATE OR replace procedure p1_peliculas() as $$
declare
fila record;
resultado varchar=E'\n';
begin
for fila in (select titulo from peliculas) loop

resultado=resultado||fila.titulo||E'\n';

end loop;

raise notice '%',resultado;
end;$$  language plpgsql    