with Ada.Integer_Text_IO;

procedure nine is
   N: Integer;
   tmp: Integer := 0;
begin
   Ada.Integer_Text_IO.Get(N);
   while N > 0 loop
      tmp := N mod 10 + tmp;
      N := N / 10;
   end loop;
   Ada.Integer_Text_IO.Put(tmp);
   end nine;
