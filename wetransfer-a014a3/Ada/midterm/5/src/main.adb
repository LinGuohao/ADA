with Conveyer_System,Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   procedure pr is
   begin
      Put_Line("*");
   end pr;

   type Toys is (Nothing, Car, Doll, Ball);
   package cs is new Conveyer_System(Toys,Natural,pr);
   use cs;





   belt:Conveyer(10);
   d:Dir:=Right;
   AA : Algorithm := (Put, Move_Right, Move_Right, Put);
begin
   Show(belt);
   Move_Robot(belt,3);
   Put(belt,Car);
   Show(belt);
   Put_Line(Toys'Image(Get(belt)));
   Move(belt);
   Show(belt);
   Move(belt);
   Move(belt,d);
   Show(belt);
   Move(belt);
   Move(belt);
   Move(belt);
   Show(belt);
   Move_Robot(belt,5);
   Put_Line(Toys'Image(Get(belt)));
   Run (belt, AA, 1);
   Show (belt);

end Main;
