with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
   protected Printer is
      procedure Print(s:String);
   end Printer;

   protected body Printer is
      procedure Print(s:String) is
      begin
         Put_Line(s);
      end Print;
   end Printer;


   task Gate is
      entry Shoot;
      entry Keeper(param:Boolean);
   end Gate;
   task GoalKepper;
   task Player;

   task body Gate is
      ready:Boolean:=False;
   begin
      loop
         select
            when ready => accept Shoot  do
               Printer.Print("Goal was shot");
               end Shoot;
         or
            accept Keeper (param : in Boolean) do
               ready:=param;
               Printer.Print("The goalkeeper send this state: "&param'Image);
            end Keeper;
         or
            terminate;
         end select;

      end loop;

   end Gate;


   task body GoalKepper is
   begin
      --delay 2.0;
      Gate.Keeper(True);
      delay 5.0;
      Gate.Keeper(False);
   end GoalKepper;

   task body Player is
      scored:Boolean:=false;
   begin
      delay 1.0;
      while not scored loop
         select
            Gate.Shoot;
            scored:=true;
         or
            delay 1.0;
            Printer.Print("Goal attempted");
         end select;
         delay 1.0;
      end loop;


   end Player;



begin
   --  Insert code here.
   null;
end Main;
