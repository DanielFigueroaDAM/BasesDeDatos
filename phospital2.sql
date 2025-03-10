create or replace procedure phospital2() as $$
declare
fila record;
resultado varchar=E'\n';
count integer=0;
medicovc varchar;
fila2 record;
codhosp varchar;
begin
    for fila in (select * from hospital) loop
        resultado=resultado||fila.nomh||E'\n';
        select codh into codhosp from hospital where nomh=fila.nomh;
        for fila2 in select * from hosp1 where codh=codhosp loop
            select distinct codm into medicovc from hosp1 where 
        end loop;
    end loop;


raise notice '%',resultado;
end;$$  language plpgsql 
