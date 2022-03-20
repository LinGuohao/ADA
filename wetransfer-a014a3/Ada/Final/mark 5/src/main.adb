with Ada.Text_IO,Ada.Numerics.Float_Random,Ada.Calendar;
use Ada.Text_IO,Ada.Numerics.Float_Random;
procedure Main is

   type Str is access String;
   type PlayerArr is array(1..2) of Natural;

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

   protected ScoreBoard is
      procedure Score(id:Positive);
      function GetScore(id:Positive) return Natural;
   private
      counter:PlayerArr:=(others=>0);
   end ScoreBoard;

   protected body ScoreBoard is
      procedure Score(id:Positive) is
      begin
         counter(id):=counter(id)+1;
      end Score;

      function GetScore(id:Positive) return Natural is
      begin
         return counter(id);
      end GetScore;
   end ScoreBoard;



   task Gate is
      entry Shoot(id:Positive;name:Str);
      entry Keeper(param:Boolean);
   end Gate;
   task GoalKepper is
      entry Done;
   end GoalKepper;

   task type Player(id:Positive;s:Str) is
      entry Done;
   end Player;


   task body Gate is
      ready:Boolean:=False;
   begin
      loop
         select
            when ready => accept Shoot(id:Positive;name:Str)  do
                  --Printer.Print("Goal was shot by "&name.all);
                  Printer.Print("Its a goal!");
                  ScoreBoard.Score(id);
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

   task type Ball(id:Positive;s:Str) is
      entry Shoot;
   end Ball;


   task body Ball is

   begin
      Printer.Print("Ball shot by"&s.all);
      accept Shoot;
      select

         Gate.Shoot(id,s);
      else
         Printer.Print("Missed!");
      end select;

   end Ball;


   type BPtr is access Ball;

   task body Player is
      --scored:Boolean:=false;
      b:BPtr;
      terminated:Boolean:=false;
   begin
      delay 1.0;
      while ScoreBoard.GetScore(id) < 4 and not terminated loop
         select
            accept Done  do
               terminated:=True;
            end Done;
            exit;
            --Gate.Shoot(s);
            --scored:=true;
         or
           delay 0.1;
            b:=new Ball(id,s);
            b.Shoot;

         or
            delay 1.0;
            Printer.Print("Goal attempted by "&s.all);


         end select;
         delay 1.0;

      end loop;

      Printer.Print(s.all & " terminated");

   end Player;


   type PlayerPtr is access Player;
   p:PlayerPtr;
   m:PlayerPtr;
   start :Ada.Calendar.Time;
begin
   start:=Ada.Calendar.Clock;
   p:=new Player(1,new String'("P1"));
   delay 1.0;
   m:=new Player(2,new String'("P2"));
   while Ada.Calendar."-"( Ada.Calendar.Clock, start )<10.0 loop
      null;
   end loop;


   GoalKepper.Done;
   if p'Callable then

      p.Done;
   end if;

   if m'Callable then

      m.Done;
   end if;


exception
      when Tasking_Error => null;



end Main;
