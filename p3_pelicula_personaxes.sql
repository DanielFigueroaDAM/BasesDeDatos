/*
crear procedemento chamado p3_peliculas_personaxes que o titulo de todas as 
peliculas e para cada una delas os codigos e nomes dos personaxes que intereñen nelas
call p2_peliculas_personaxes();
*/
CREATE OR REPLACE procedure p3_peliculas_personaxes() as $$
DECLARE
    filap record;
    filai record;
    resultado varchar=E'\n';
    nombrePersonaxe varchar;
BEGIN
    for filap in (select * from peliculas) loop
        resultado=resultado || 'titulo: ' || filap.titulo || E'\n';
        for filai in (select * from interpretespel where codpel=filap.codpel) loop
            nombrePersonaxe=E'\t'||(select nomper from personaxes where codper=filai.codper);
            resultado=resultado || nombrePersonaxe || ' ' || filai.codper || E'\n';
        end loop;
    end loop;
    raise notice '%',resultado;
END;
$$ LANGUAGE plpgsql;