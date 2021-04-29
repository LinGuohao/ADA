with Ada.Text_IO,test1;
procedure main is
   V : Positive;
begin
   V:= -1;
   test1(V);
exception
   when  testException =>

      Ada.Text_IO.Put_Line("1");
end main;
