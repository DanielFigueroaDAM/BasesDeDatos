create or replace function fsumapares(a numeric) returns integer language plpgsql as $$

declare
r integer=0; 
begin
for i in 1..a loop
r=r+2*(i-1);
end loop;

return r;
end;$$
