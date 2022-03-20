with Ada.Text_IO;use Ada.Text_IO;
function Most_Frequent (V:Vector) return element is
   max: Integer;
   tmp: element;
   tmpnumber:Integer;
   function Multiplicity(Pattern:element) return Integer is
   cont:Integer;
   begin
      cont := 0;
      for i in V'Range loop
         if(V(i) = Pattern) then
            cont:= cont+1;
         end if;
      end loop;
      return cont;
   end Multiplicity;
begin
   tmp:= V(V'First);
   max:= Multiplicity(tmp);
   for i in V'Range loop
      tmpnumber := Multiplicity(v(i));
      if(max < tmpnumber ) then
         max := tmpnumber;
         tmp := V(i);
      end if;
   end loop;
   return tmp;

end Most_Frequent;
