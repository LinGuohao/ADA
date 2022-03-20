with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   task John;
   task Sport is
      entry Go_in;
   end Sport;
   task Shoe is
      entry Go_in;
   end Shoe;
   task Electronic is
      entry Go_in;
   end Electronic;

   task body Sport is
   begin

   end Sport;


   task body John is
   begin
      delay 0.1;
      select
         Shop.Sport;
      or
         delay 0.1;
         Shop.Shoes;
      or
         delay 0.1;
         Shop.Electronic;
      or
         delay 0.3;

   end John;

begin
   --  Insert code here.
   null;
end Main;
