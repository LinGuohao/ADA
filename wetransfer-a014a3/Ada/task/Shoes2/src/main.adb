with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
   task Left is
      entry Init;
   end Left;
   task body Left is
   begin

      for i in 1..5 loop
         accept Init  do
            Put_Line("Left");
         end Init;
      end loop;
   end Left;

   task Right is
      entry Init;
   end Right;
   task body Right is
   begin

      for i in 1..5 loop
         accept Init  do
            Put_Line("Right");
         end Init;
      end loop;
   end Right;


   task Sand;
   task body Sand is
   begin

      for i in 1..5 loop
         --Put_Line("Sand");
         Left.Init;
         Right.Init;
      end loop;
   end Sand;

begin
   --  Insert code here.
   null;
end Main;
