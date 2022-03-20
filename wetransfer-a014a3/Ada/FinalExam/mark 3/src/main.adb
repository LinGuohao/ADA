with Ada.Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Numerics.Float_Random;
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

   Gen : Ada.Numerics.Float_Random.Generator;

   protected Safe_Generator is
      procedure Generate;
      function GetVal return Float;
   private
      value:Float;
   end Safe_Generator;


   protected body Safe_Generator is
      procedure Generate is
      begin
         Reset(Gen);
         value:= Ada.Numerics.Float_Random.Random (Gen);

      end Generate;

      function GetVal return Float is
      begin
         return value;
      end GetVal;

   end Safe_Generator;


   task Gate is
      entry Shoot;
      entry Keeper(param:Boolean);
   end Gate;
   task GoalKepper is
      entry Done;
   end GoalKepper;

   task type Player;

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
      val:Float;
   begin

      --Gate.Keeper(True);
      --delay 1.0;
      --Gate.Keeper(False);
      loop
         select
            accept Done  do
               Printer.Print("10 seconds up");
               Gate.Keeper(False);
            end Done;
            exit;
         or
            delay 1.5;
            Safe_Generator.Generate;
            val:=Safe_Generator.GetVal;
            if val < 0.7 then
               Gate.Keeper(True);
            else
               Gate.Keeper(False);
            end if;
         end select;

      end loop;

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


   type PlayerPtr is access Player;
   p:PlayerPtr;
   start :Ada.Calendar.Time;
begin
   start:=Ada.Calendar.Clock;
   p:=new Player;
   delay 1.0;
   p:=new Player;
   while Ada.Calendar."-"( Ada.Calendar.Clock, start )<10.0 loop
      null;
   end loop;

   GoalKepper.Done;


end Main;
