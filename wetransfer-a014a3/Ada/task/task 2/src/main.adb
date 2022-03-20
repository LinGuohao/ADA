with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   type Colour is (Red,Yellow,Green);

   protected Lamp is
      entry
      procedure Change;
      function isColour return Colour;
   private
      light:Colour:=Red;
   end Lamp;

   procedure Change is
   begin
      Put_Line(Colour'Image(light));
      if light= Green then
         light:=Red;
      else
         light:=Colour'Succ(light);
      end if;
   end Change;




begin
   --  Insert code here.
   null;
end Main;
