function Count_Value(g:Grid) return Natural is
   sum:Natural:=0;
begin
   for i in g'Range(1) loop
      for j in g'Range(2) loop
         if pred(g(i,j)) then
            sum:=sum+1;
         end if;

      end loop;
   end loop;

   return sum;
end Count_Value;
