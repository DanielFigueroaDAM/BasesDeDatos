/*tlimitesolp
impedir que una personaxe tipo soldado poda ter por xefe a outro soldado (inserindo)

insert into personaxes values ('p48','zira','soldado','p21');
'este personaxe e un soldado e non debe ter por xefe a outro soldado'

insert into personaxes values ('p48','zira','soldado','p46');
'rexistro inserido'

insert into personaxes values ('p49','nerf','cabo','p21');
'rexistro inserido'*/
DROP TRIGGER IF EXISTS tlimitesolp ON personaxes;

CREATE OR REPLACE FUNCTION ft_limitesolp() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$
DECLARE
    tipo_xefe TEXT;
BEGIN
    -- Obtener el tipo del jefe (si existe)
    SELECT graduacion INTO tipo_xefe 
    FROM personaxes 
    WHERE codper = NEW.codper2;

    -- Si el nuevo personaje es un soldado y su jefe también lo es, bloqueamos la inserción
    IF NEW.graduacion = 'soldado' AND tipo_xefe = 'soldado' THEN
        RAISE EXCEPTION 'Este personaxe é un soldado e non debe ter por xefe a outro soldado';
    ELSE
        RAISE NOTICE 'Rexistro inserido';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER tlimitesolp 
BEFORE INSERT ON personaxes 
FOR EACH ROW 
EXECUTE FUNCTION ft_limitesolp();
