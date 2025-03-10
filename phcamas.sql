create or replace procedure phcamas(ncam integer) as $$
declare
fila record;
fila2 record;
nome varchar;
resultado varchar=E'\n';
contadorp integer=0;
contadorh integer=0;
begin
    for fila in (select * from hospital where codh in (select codh from propio) and numc>ncam) loop
        resultado=resultado||fila.nomh||E'\n';
        contadorh=contadorh+1;
        contadorp=0;
        for fila2 in (select codp,numas from hosp1 where codh=fila.codh) loop
            select nomas into nome from asegurado where codp=fila2.codp and numas=fila2.numas;
            resultado=resultado||'    '||nome||E'\n';
            contadorp=contadorp+1;
        end loop;
        resultado=resultado||'    '||'El numero de hospitalizado es '|| contadorp ||E'\n';
    end loop;
    if contadorh=0 then
        resultado='Non hai hospitais con máis de '||ncam||' camas';
    end if;
    if contadorp=0 then
        resultado='Non hai pacientes en hospitais con máis de '||ncam||' camas';
    end if;

raise notice '%',resultado;
end;$$  language plpgsql 
