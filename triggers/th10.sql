DROP TRIGGER IF EXISTS th10 ON hosp2;
CREATE or REPLACE FUNCTION ft_h10()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    areap varchar;
    aream varchar;
    fila record;
    comp boolean=false;

BEGIN
    select coda into areap from asegurado where codp=new.codp and new.numas=new.numas;
    for fila in  SELECT coda from adscrito where codm=new.codm loop
        if areap = fila.coda then
            comp = true;
        end if;
    end loop;
    if comp = false then
        RAISE EXCEPTION 'O medico non pertence a area do asegurado';
    else
        RAISE NOTICE 'O medico pertence a area do asegurado';
    end if;

RETURN NEW;
END;
$$;

CREATE TRIGGER th10
AFTER INSERT
ON hosp2
FOR EACH ROW
EXECUTE FUNCTION ft_h10();