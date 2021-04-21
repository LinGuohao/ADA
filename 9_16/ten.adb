with Ada.Integer_Text_IO;
with Ada.Text_IO;
procedure ten is
   N: Integer;
   tmp: Integer := 0;
begin
   Ada.Integer_Text_IO.Get(N);
   if N mod 9 /= 0 then
      Ada.Text_IO.Put_Line ("can divided by 9");
   else
      Ada.Text_IO.Put_Line("Cant divided by 9");
      end if;

   while N > 0 loop
      tmp := N mod 10 + tmp;
      N := N / 10;
   end loop;

     if tmp mod 9 /= 0 then
      Ada.Text_IO.Put_Line("sum of digits can divided by 9");
   else
      Ada.Text_IO.Put_Line("sum of digits can divided by 9");
      end if;



   end ten;
