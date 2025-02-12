create or replace function ffactorial( a numeric) returns INTEGER language plpgsql as $$
declare
	r integer =1;
begin
	FOR i iN 1..a  loop
	r=r*i;
	end loop;
return r ;
end;$$
