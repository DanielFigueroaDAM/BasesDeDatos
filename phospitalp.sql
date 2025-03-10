create or replace procedure phospitalp(vnomeh varchar) as $$
declare
fila record;
fila2 record;
resultado varchar=E'\n';
chospit varchar;
nomes varchar;
count integer=0;
begin
select codh into chospit from hospital where nomh=vnomeh;
if chospit is not null then  
    for fila in select * from hosp1 where codh=chospit loop
        select nomas into nomes from asegurado where codp=fila.codp and numas=fila.numas;
        resultado=resultado||nomes||E'\n';
        count=count+1; 
    end loop;
else
    resultado='Non existe hospital con ese nome';
end if;
if count=0 then
    resultado='Non hai pacientes no hospital';
end if;


raise notice '%',resultado;
end;$$  language plpgsql 
