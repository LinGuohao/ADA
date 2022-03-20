with Ada.Text_IO,Ada.Numerics.Float_Random;
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

   task Door is
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
                  Printer.Print("Door is opened");
                  tr:=new Trap;
               end Open;
         or
            when not closed => accept Close  do
                  closed:=True;
                  Printer.Print("Door is closed");
               end Close;
         or
              terminate;
         end select;
      end loop;
   end Door;

   task Burgral is
      entry hit;
   end Burgral;
   task body Burgral is
   begin
      delay 1.0;
      Door.Open;
      select
         accept hit  do
            Printer.Print("Burglar got hit");
         end hit;
      or
         delay 3.0;
      end select;

      Door.Close;
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
   --  Insert code here.
   null;
end Main;
