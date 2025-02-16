-- crea trigger chamado tactualizanumx tal que cando insira un novo xogador na taboa xogador actualize o numero de xogadores do seu equjipo en 
-- 1 (sumarlle 1 ao campo  da taboa equipo)
-- Expemplo de como sumar 1 ao numero de xogadores (cammpo numx) do equipo 1
-- update equipo set numx=numx+1 where codequ='e1';

drop trigger if exists t1_tactualizanumx on xogador; 
create or replace function ft_actualizanumx() returns trigger language plpgsql as $$
declare 

salariominactual integer;


begin


    UPDATE equipo
    SET numx = numx + 1
    WHERE codequ = new.codequ;

    RETURN NEW
return new;
end; $$;

create trigger t1_tactualizanumx before insert on xogador for each row execute procedure ft_actualizanumx();
