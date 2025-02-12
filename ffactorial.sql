create or replace function ffactorial(a numeric) returns integer language plpgsql as $$

declare
r integer=0; 
begin
for i in 1..a loop
r=r+i;
end loop;

return r;
end;$$
