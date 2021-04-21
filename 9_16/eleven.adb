with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure eleven is

   sum: Integer :=0;
   tmp : Float;
   tmp2 : Integer;
begin

   for j in 2..10000 loop

   sum :=0;
   tmp := Float(j);
   tmp2 := Integer(j)/2;

      for I in 2..tmp2 loop
         if j mod I = 0 then
         sum := I + sum ;
         end if;
      end loop;

      if (sum + 1) = j then
         ada.Integer_Text_IO.Put(j);
         end if;



   end loop;
   end eleven;
