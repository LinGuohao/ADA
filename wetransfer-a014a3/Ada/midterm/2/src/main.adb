with Conveyer_System,Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   type Toys is (Nothing, Car, Doll, Ball);
   package cs is new Conveyer_System(Toys,Natural);
   use cs;


   belt:Conveyer(10);
begin
   Show(belt);
   Move_Robot(belt,3);
   Put(belt,Car);
   Show(belt);
    Put_Line(Toys'Image(Get(belt)));
   Move_Robot(belt,5);
   Put_Line(Toys'Image(Get(belt)));

end Main;
