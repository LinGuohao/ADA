
function Count_Value(g:Grid) return Natural is
   cnt: Natural:=0;
begin
   for I in g'Range(1) loop
      for J in g'Range(2) loop
         if pred(g(i,j)) then
            cnt:=cnt+1;

         end if;
      end loop;
   end loop;
   return cnt;
end Count_Value;
