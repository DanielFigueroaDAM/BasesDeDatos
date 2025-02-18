/*
impedir que un repartidor cargue pedidos que sean de clientes de zonas distintas as que el esta asignado
insert into carga values ('p13','z1',1,2,'12/7/11',18);
este pedido non corresponde repartilo a este repartido
insert into carga values ('p13','z2',1,2,'12/7/11,18');
pedido cargado
*/

DROP TRIGGER IF EXISTS trepartepedido ON carga;
CREATE or REPLACE FUNCTION ft_repartepedido()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    zonaR varchar;
    dni varchar;
    zonaC varchar;
BEGIN
    SELECT codz into zonaR from repartidor where n = new.n and codz=new.codz;
    select nif into dni from pedido where codp=new.codp;
    select codz into zonaC from cliente where nif=dni;
    if(zonaC<>zonaR) THEN
        RAISE EXCEPTION 'este pedido non corresponde repartilo a este repartidor';
    ELSE
        RAISE NOTICE 'Rpedido cargado';
    END IF;
return new;
end; $$;
CREATE TRIGGER  trepartepedido 
BEFORE INSERT ON carga
FOR EACH ROW 
EXECUTE FUNCTION ft_repartepedido();


