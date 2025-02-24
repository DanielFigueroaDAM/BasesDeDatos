/*
tactxog.sql

trigger que impida cambiar el salario de un jugador a mas del doble de su salario actual:
*/



DROP TRIGGER IF EXISTS tactxog ON xogador;
CREATE or REPLACE FUNCTION ft_actxog()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN

if(new.salario>old.salario*2) then
	raise exception 'no es valido';
else
	raise notice 'si es valido';

RETURN NEW;
END;
$$;

CREATE TRIGGER tactxog
BEFORE UPDATE
ON xogador
FOR EACH ROW
EXECUTE FUNCTION ft_actxog();
	
