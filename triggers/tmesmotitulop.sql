
DROP TRIGGER IF EXISTS tmesmotitulop ON peliculas;

CREATE OR REPLACE FUNCTION ft_memotitulop()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    cont INTEGER;
BEGIN
    select count(*) into cont from series where titulo = new.titulo; 
    if(cont >= 1) then
        RAISE EXCEPTION 'Este título xa está en series';
    else
        RAISE NOTICE 'Rexistro inserido';
    end if;
    RETURN NEW;
    END;
    $$;

CREATE TRIGGER tmesmotitulop
BEFORE INSERT ON peliculas
FOR EACH ROW
EXECUTE FUNCTION ft_memotitulop();