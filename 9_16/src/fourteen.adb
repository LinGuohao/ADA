with Ada.Integer_Text_IO;
with Ada.Text_IO;
procedure fourteen is
   N : Integer;
   X: Integer;
   tmp: Integer := 1;
begin
   Ada.Integer_Text_IO.Get(N);
   Ada.Integer_Text_IO.Get(X);
   X:= X-1;
   for i in 1..X loop
      tmp := N *N *tmp;

   end loop;
   tmp := tmp *N;
   Ada.Integer_Text_IO.Put(tmp);
   end fourteen;
