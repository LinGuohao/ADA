function Count(g:Grid) return Natural is
   sum:Natural:=0;
begin
   for i in g'Range(1) loop
      for j in g'Range(2) loop
         sum:=sum+g(i,j);
      end loop;
   end loop;

   return sum;
end Count;
