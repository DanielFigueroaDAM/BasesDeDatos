/*
Triger tmaxseriesp  que impida que un actor traballe en mais de 4 series distintas


insert into interpretesser values('a2', 'p1','s5',5);
aceptada insercion

insert into interpretesser values('a2', 'p7','s2',15);
NON

insert into interpretesser values('a2', 'p14','s5',25);
acptada insercion
*/

DROP TRIGGER IF EXISTS tmaxseriesp ON interpretesser;

CREATE OR REPLACE FUNCTION ft_maxseriesp()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    cont INTEGER;
BEGIN
    SELECT COUNT(DISTINCT cods) INTO cont
    FROM interpretesser
    WHERE coda = NEW.coda;

    IF cont >= 4 THEN
        RAISE EXCEPTION 'Este actor xa traballou en 4 series distintas';
    ELSE
        RAISE NOTICE 'Rexistro inserido';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER tmaxseriesp
BEFORE INSERT ON interpretesser
FOR EACH ROW
EXECUTE FUNCTION ft_maxseriesp();