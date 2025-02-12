create or replace function mediaSalario(cod varchar) returns integer language plpgsql as $$

declare
r integer;
vcodequ xogador.codequ%type;
begin
select codequ into vcodequ from xogador where codx=cod;
select avg(salario) into r from xogador where codequ=vcodequ;
return r;
end;$$
