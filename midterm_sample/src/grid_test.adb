with Count,Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure grid_test is

   type amatrix is array(Integer range<>,Integer range<>) of Natural;

   function testGrid is new Count(Integer,amatrix);
   test : amatrix(1..10,1..10):=((1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10));
begin

   Put(testGrid(test));
end grid_test;
