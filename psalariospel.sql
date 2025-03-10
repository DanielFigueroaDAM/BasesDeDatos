/*
crear un procedemento chamado psalariospel que amose canto se gastou en salarios de actores na realización 
dunha pelicula cuxo titulo se pasa como parametro
NOTA: o calculo do salario dun actor faise multiplicando o numero de horas  que interviu na pelicula polo seu cachehora
*/
CREATE OR REPLACE procedure psalariospel(titulov varchar) as $$
declare
horasTrabajadas integer;
multicadosSalarios integer;
totalSalarios integer=0;
codigopel varchar;
porhora integer;
fila record;
begin
select codpel into codigopel from peliculas where titulo=titulov;

for fila in (select * from interpretespel where codpel=codigopel) loop
    select coalesce(cachehora,0) into porhora from actores where coda=fila.coda;
    select sum(coalesce(horas,0)) into horasTrabajadas from interpretespel where codpel=codigopel and coda=fila.coda;
    multicadosSalarios=horasTrabajadas*porhora;
    totalSalarios=totalSalarios+multicadosSalarios;
end loop;
raise notice 'total salarios: %',totalSalarios;
end;
$$ LANGUAGE plpgsql;

