with Ada.Text_IO;
function Count(n:Grid) return Natural is
   sum : Natural;
begin
   sum := 0;
   for i in n'Range(1) loop
      for j in n'Range(2) loop

         sum := sum + n(i,j);
      end loop;
   end loop;
   return sum;
end Count;
