create or replace function fcontasuma() returns integer language plpgsql as $$

declare
c integer=0;
a integer=0;

begin
c=c+1;
a=a+c;
c=c+1;
a=a+c;
return a;
end;$$
