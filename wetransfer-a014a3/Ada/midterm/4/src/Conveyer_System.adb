with Rotate,Ada.Text_IO;
use Ada.Text_IO;
package body Conveyer_System is

   procedure Move_Robot(a:in out Conveyer;i:Index) is
   begin
      a.Robot_Position:=i;
   end Move_Robot;


   procedure Put(a:in out Conveyer;e:Item) is
   begin
      if a.Items(a.Robot_Position) /= Item'Val(0) then
         raise Slot_Not_Empty;
      end if;

      a.Items(a.Robot_Position):=e;
   end Put;

   function Get(a:Conveyer) return Item is
   begin
      if a.Items(a.Robot_Position) = Item'Val(0) then
         raise Slot_Is_Empty;
      end if;

      return a.Items(a.Robot_Position);
   end Get;

   procedure Show(a:in Conveyer) is
   begin
      Put_Line("The content of the belt:");
      for i in a.Items'Range loop

         Put_Line(Item'Image(a.Items(i)));

      end loop;

      Put_Line("Finished belt");
   end Show;

   procedure Move(a:in out Conveyer;d:Dir:=Left) is
      procedure rot is new Rotate(Item,Index,TArray);
   begin
      rot(a.Items,d=Left);

   end Move;



end Conveyer_System;
