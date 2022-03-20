
with Count,More_Than,Count_Value,Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   type Matrix is array(Integer range <>,Integer range<>) of Natural;
   M:Matrix:=((1,2,3),(2,3,4),(3,2,1));
   function test is new Count(Integer,Natural,Matrix);
   function test2 is new More_Than(Integer,Matrix);
   function More(t:Natural) return Boolean is
   begin
      if(t > 3) then
         return True;
      else
         return False;
      end if;
   end More;
   function test3 is new Count_Value(Integer,Natural,Matrix,More);
begin
   Put_Line(Integer'Image(test3(M)));
end Main;
