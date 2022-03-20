with Count_value,Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Count_value_test is
   type amatrix is array(Integer range<>,Integer range<>) of Natural;
   function Op(E: Natural) return Boolean is
   begin
      if(E > 3) then
         return True;
      else
         return False;
      end if;
   end Op;
   function test is new Count_value(Natural,Integer,amatrix,Op);
   testarr : amatrix(1..10,1..10):=((1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10));
begin
   Put(test(testarr));
end Count_value_test;
