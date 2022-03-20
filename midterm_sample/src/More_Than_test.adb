with More_Than,Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure More_Than_test is

   type amatrix is array(Integer range<>,Integer range<>) of Natural;

   function test_Morethen is new More_Than(Integer,amatrix);
   test : amatrix(1..10,1..10):=((1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10));
begin
   Put(test_Morethen(test,5));
end More_Than_test;
