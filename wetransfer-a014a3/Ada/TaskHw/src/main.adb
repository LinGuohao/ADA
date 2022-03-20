with Ada.Text_IO,Ada.Numerics.Discrete_Random,Ada.Calendar;
use Ada.Text_IO;
procedure Main is

   package randomBoolean is new Ada.Numerics.Discrete_Random(Boolean);
   subtype Index is Positive range 1..10;
   package randomPos is new Ada.Numerics.Discrete_Random(Index);



   type Position is record
     x: Natural;
     y: Natural;
   end record;

   type Direction is (left,right,up,down);

   package randomDir is new Ada.Numerics.Discrete_Random(Direction);

   protected Generator is
      procedure Init;
      function GetRand return Boolean;
      function GetRandPos return Position;
      function GetRandDir return Direction;
   private
      g:randomBoolean.Generator;
      k:randomPos.Generator;
      l:randomDir.Generator;
   end Generator;

   protected body Generator is
      procedure Init is
      begin
         randomBoolean.Reset(g);
         randomPos.Reset(k);
         randomDir.Reset(l);

      end Init;

      function GetRand return Boolean is
      begin
         return randomBoolean.Random(g);
      end GetRand;
      function GetRandPos return Position is
         x:Index;
         y:Index;
      begin

         --randomPos.Reset(k);
         x:=randomPos.Random(k);
         --randomPos.Reset(k);
         y:=randomPos.Random(k);
         return (x,y);
      end GetRandPos;

      function GetRandDir return Direction is
      begin
         return randomDir.Random(l);
      end GetRandDir;


   end Generator;




   protected Monitor is
      procedure Print(s:String);
   end Monitor;

   protected body Monitor is
      procedure Print(s:String) is
      begin
         Put_Line(s);
      end Print;
   end Monitor;

   type Barr is array (Natural range <>,Natural range <>) of Boolean;
   protected Area is
      procedure Init;
      function isCorrect(pos:Position) return Boolean;
      procedure pickUp(pos:Position);
      function hasGarabge(pos:Position) return Boolean;
      function getPercentage return Natural;

   private
      a : Barr(1..10,1..10);
   end Area;

   protected body Area is
      procedure Init is
         cnt:Natural:=0;
      begin

         for i in 1..10 loop
            for j in 1..10 loop
               a(i,j):=Generator.GetRand;
               if a(i,j) then
                  cnt:=cnt+1;
               end if;

            end loop;
         end loop;
         --Monitor.Print("QIKJOOO " & cnt'Image);
      end Init;

      procedure pickUp(pos:Position) is
      begin
         a(pos.x,pos.y):=false;
      end pickUp;

      function hasGarabge(pos:Position) return Boolean is
      begin
         return a(pos.x,pos.y);
      end hasGarabge;


      function isCorrect(pos:Position) return Boolean is
      begin
         if (pos.x>=1 and then pos.x<=10 and then
          pos.y>=1 and then pos.y<=10)
       then
         return True;
      else
         return False;
      end if;
      end IsCorrect;

      function getPercentage return Natural is
         cnt : Natural:=0;
      begin
         for i in 1..10 loop
            for j in 1..10 loop
               if not a(i,j) then
                  cnt:=cnt+1;
               end if;

            end loop;
         end loop;

         return cnt;
      end getPercentage;



   end Area;


   task type Robot;

   task Coordinator is
      entry Create;
   end Coordinator;

   task body Robot is

      pos:Position:=Generator.GetRandPos;
      garbage:Natural:=0;

      procedure move is
         tmp:Position;
         dir:Direction;
      begin
         loop
            tmp:=pos;
            dir:=Generator.GetRandDir;
            case dir is
               when left => tmp.x:=pos.x-1;
               when right => tmp.x:=pos.x+1;
               when up => tmp.y:=pos.y-1;
               when down => tmp.y:=pos.y+1;
            end case;

            exit when Area.isCorrect(tmp);
         end loop;
         pos:=tmp;
      end move;

   begin
      while garbage<2 loop
         if not Coordinator'Callable then
            exit;
         end if;
         Monitor.Print("Current position : " & pos.x'Image & " , "& pos.y'Image);
         if Area.hasGarabge(pos) then
            Area.pickUp(pos);
            garbage:=garbage+1;
            Monitor.Print("Robot picked up garbage");
         end if;


         delay 0.5;
         move;
      end loop;
      if Coordinator'Callable then
         Monitor.Print("One robot finished");
         Coordinator.Create;
      end if;

   end Robot;

   type RobotPtr is access Robot;



   task body Coordinator is
      start : Ada.Calendar.Time;
      a,b,c,tmp: RobotPtr;
      --int :Duration;
   begin
      Generator.Init;
      Area.Init;

      Monitor.Print("Original percentage of territory cleaned : " & Area.getPercentage'Image);

      a:=new Robot;
      b:=new Robot;
      c:=new Robot;



      start:=Ada.Calendar.Clock;
      --while Ada.Calendar."-"( Ada.Calendar.Clock, start ) < 60.0 loop
      loop
         if Ada.Calendar."-"( Ada.Calendar.Clock, start ) >=60.0 then
            exit;
         end if;

         --int:=Ada.Calendar."-"( Ada.Calendar.Clock, start );
         --Monitor.Print(int'Image);
         select
            accept Create  do
               tmp:=new Robot;
               Monitor.Print("Created new robot");
            end Create;
         end select;

         if Ada.Calendar."-"( Ada.Calendar.Clock, start ) >=60.0 then
            exit;
         end if;

      end loop;
      Monitor.Print("Percentage of territory cleaned : " & Area.getPercentage'Image);
      --exit;
   end Coordinator;


begin
   --  Insert code here.
   null;
end Main;
