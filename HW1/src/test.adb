with Ada.Integer_Text_IO;
procedure test is
   subtype Length is Positive range 1..1000;
   type TArray is array(Positive range <>) of Integer;
   Size : Integer;
   testArray : TArray(1..100);
begin
   Size := testArray'Length;

   Ada.Integer_Text_IO.Put(Size);

end test;
