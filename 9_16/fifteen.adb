with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure fifteen is
   N : Integer;
   tmp: Integer := 1;
begin
   Ada.Integer_Text_IO.Get(N);
   for i in 1..N loop
      tmp := 1 * i * tmp;
   end loop;
   Ada.Integer_Text_IO.Put(tmp);
   end fifteen;
