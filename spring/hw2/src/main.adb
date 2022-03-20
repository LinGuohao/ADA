with Ada.Text_IO, Ada.Integer_Text_IO, Conveyer_System_Gen;
use Ada.Text_IO, Ada.Integer_Text_IO;-- Conveyer_System_Gen;

procedure Main is
   type Toys is (Nothing, Car, Doll, Ball);
   type Ind is range 1..4;
   package CConveyor is new Conveyer_System_Gen(Toys, Ind);
begin
   CConveyor.Show;
   --Put("Zahid kod yazir");
end Main;
