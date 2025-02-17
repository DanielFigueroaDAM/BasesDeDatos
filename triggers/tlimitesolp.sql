/*tlimitesolp
impedir que una personaxe tipo soldado poda ter por xefe a outro soldado (inserindo)

insert into personaxes values ('p48','zira','soldado','p21');
'este personaxe e un soldado e non debe ter por xefe a outro soldado'

insert into personaxes values ('p48','zira','soldado','p46');
'rexistro inserido'

insert into personaxes values ('p49','nerf','cabo','p21');
'rexistro inserido'*/
drop trigger if exists tlimitesolp on personaxes;
create or replace function ft_limitesolp() returns trigger language plpgsql as $$
declare

