with Rotate,Ada.Text_IO;
use Ada.Text_IO;
package body Conveyer_System is

   procedure Move_Robot(a:in out Conveyer;i:Index) is
   begin
      a.Robot_Position:=i;
   end Move_Robot;


   procedure Put(a:in out Conveyer;e:Item) is
   begin
      a.Items(a.Robot_Position):=e;
   end Put;

   function Get(a:Conveyer) return Item is
   begin
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

   procedure Move(a:in out Conveyer) is
      procedure rot is new Rotate(Item,Index,TArray);
   begin
      rot(a.Items);

   end Move;



end Conveyer_System;
