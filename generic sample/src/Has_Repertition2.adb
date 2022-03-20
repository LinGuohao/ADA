with Ada.Text_IO; use Ada.Text_IO;
function Has_Repertition2 (V:Vector) return Integer is
   type tmpArray is array (index range<>) of Integer;
   a:tmpArray (V'Range);
   max:Integer;
   function Multiplicity(E:element; j:index) return Integer is
      cont:Integer;
   begin
      cont:=0;
      for i in V'First..j loop
         if(V(i) = E) then
            cont:= cont + 1;
         end if;
      end loop;
      return cont;
   end Multiplicity;
begin
   for i in a'Range loop
      a(i):= Multiplicity(V(i),i);
   end loop;
   max:= a(a'First);
   for i in a'Range loop
      if(max< a(i)) then
         max:= a(i);
      end if;
   end loop;
   return max;
end Has_Repertition2;
