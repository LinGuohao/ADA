with Migrate,Ada.Integer_Text_IO,Ada.Text_IO; use Ada.Integer_Text_IO;

procedure Migrate_test is

   type amatrix is array(Integer range<>,Integer range<>) of Natural;

   procedure test is new Migrate(Integer,amatrix);
   testarr : amatrix(1..10,1..10):=((1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10),(1,2,3,4,5,6,7,8,9,10));
   testarr2: amatrix(1..3,1..3):=((2,4,5),(3,1,6),(2,10,4));
begin
   test(testarr2,8);
   for i in testarr2'Range(1) loop

         for j in testarr2'Range(2) loop
         Put(testarr2(i,j));


         end loop;
         Ada.Text_IO.New_Line;
   end loop;

   --Ada.Text_IO.Put_Line(Natural'Image(testarr(1,1)));
   --Ada.Text_IO.Put_Line(Natural'Image(testarr(2,1)));

end Migrate_test;
