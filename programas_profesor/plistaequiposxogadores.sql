create or replace procedure plistaequiposxogadores() as $$
declare 
filae record;
filax record;
resultado varchar=E'\n';
totalsalarios integer=0;
begin
for filae in (select * from equipo) loop
resultado=resultado||filae.codequ||' '||filae.nomequ||E'\n';
  totalsalarios=0;
    for filax in (select * from xogador where codequ=filae.codequ)  loop
  resultado=resultado||E'\t'||filax.codx||' '||filax.nomx||' '||coalesce(filax.codequ,' sen equipo ')||' '||coalesce(filax.salario::TEXT,' sen salario')||E'\n';
    totalsalarios=totalsalarios+ coalesce(filax.salario,0);
    end loop;
	resultado= resultado||'total:'||  totalsalarios||E'\n';
end loop;
raise notice '%',resultado; 

end;$$ language plpgsql
