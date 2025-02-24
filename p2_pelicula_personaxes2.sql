/*
crea procedemento chamado 
p2_pelicula_personaxes tal que dado un codigo de pelicula imprima o seu titulos
e os codigos dos personaexes que interveñen nela
ejemplo:
select p2_pelicula_personaxes('pel21');
titulo: search_spock
p1
p2
p6
p7
p8
tablas: pelculas-interpretespel-personaxes
*/

CREATE OR REPLACE procedure p2_pelicula_personaxes2(codpelicula varchar) as $$

DECLARE
    fila record;
    resultado varchar=E'\n';
BEGIN
    resultado=resultado || 'titulo: ' || (select titulo from peliculas where codpel=codpelicula) || E'\n';
    for fila in (select * from interpretespel where codpel=codpelicula) loop
        resultado=resultado || fila.codper || E'\n';
    end loop;
    raise notice '%',resultado;
END;
$$ LANGUAGE plpgsql;
