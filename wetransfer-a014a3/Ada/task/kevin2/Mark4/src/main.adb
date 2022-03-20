with Ada.Text_IO,Ada.Numerics.Float_Random,Ada.Numerics.Discrete_Random;
use Ada.Text_IO,Ada.Numerics.Float_Random;
procedure Main is

   protected Printer is
      procedure Print(what:String);
   end Printer;

   protected body Printer is
      procedure Print(what:String) is
      begin
         Put_Line(what);
      end Print;
   end Printer;

   Gen : Ada.Numerics.Float_Random.Generator;


   protected Safe_Generator is
      procedure Generate;
      function GetVal return Duration;
   private

      value:Duration;
   end Safe_Generator;




   protected body Safe_Generator is
      procedure Generate is

         Rnd : Float;
      begin
         Reset(Gen);
         Rnd:= Ada.Numerics.Float_Random.Random (Gen);
         value:=Duration(Rnd*4.0);
      end Generate;

      function GetVal return Duration is
      begin
         return value;
      end GetVal;

   end Safe_Generator;
   task type Trap;

   type trapPtr is access Trap;

   task type Door(ID:Natural) is
      entry Open;
      entry Close;
   end Door;

   task body Door is
      closed:Boolean:=true;
      tr:trapPtr;
   begin
      loop
         select
            when closed => accept Open  do
                  closed:=false;
                  Printer.Print("Door " & ID'Image & " is opened");
                  tr:=new Trap;
               end Open;
         or
            when not closed => accept Close  do
                  closed:=True;
                  Printer.Print("Door " & ID'Image & " is closed");
               end Close;
         or
              terminate;
         end select;
      end loop;
   end Door;

   type DoorPtr is access Door;

   package randInt is new Ada.Numerics.Discrete_Random(Positive);
   g: randInt.Generator;
   type arrD is array(1..5) of DoorPtr;

   protected House is
      procedure Init;
      procedure Get_Door(doo:out DoorPtr);
   private
      arr:arrD;
   end House;

   protected body House is
      procedure Init is

      begin
         for i in 1..5 loop
            arr(i):=new Door(i);
         end loop;

      end Init;
      procedure Get_Door(doo:out DoorPtr) is

      begin
         --Printer.Print("Im in");
         randInt.Reset(g);

         doo:=arr(randInt.Random(g) rem 5);

         Printer.Print("I randomly selected " & doo.ID'Image);
      end;

   end House;




   task Burgral is
      entry hit;
   end Burgral;
   task body Burgral is
      d:DoorPtr;
   begin
      delay 1.0;

      House.Get_Door(d);

      d.all.Open;
      select
         accept hit  do
            Printer.Print("Burglar got hit");
         end hit;
      or
         delay 3.0;
      end select;

      d.all.Close;
   end Burgral;


   task body Trap is
      dur:Duration;
   begin
      Safe_Generator.Generate;
      dur:=Safe_Generator.GetVal;
      Printer.Print("Time : "&dur'Image);
      delay dur;
      select
         Burgral.hit;
      or
         delay 0.01;
      end select;

   end Trap;




begin
   House.Init;
end Main;
