with Ada.Text_IO,Ada.Numerics.Float_Random;use Ada.Text_IO;
with ada.numerics.discrete_random;
procedure Kevin4 is
   protected Printer is
      procedure Print(S:in String);
   end Printer;

   task type Door(ID:Integer) is
      entry Open;
      entry Close;
   end Door;
   task Burglar is
      entry Hit;
   end Burglar;
   task type Trap;

   protected Safe_Random is
      procedure Generate(num: in out Float);
      function Int_Rand5 return Integer;
   end Safe_Random;
   type Trap_Pointer is access Trap;
   type Door_Pointer is access Door;
   type DoorArray is array (1..5) of Door_Pointer;
   protected House is
      procedure Init;
      procedure Get_Door(aDoor:in out Door_Pointer);
   private
      DoorList : DoorArray;
   end House;


   --------------------body---------------------------
   protected body Printer is
      procedure Print(S:in String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;


   task body Door is
      is_Open : Boolean := True;
      aTrap: Trap_Pointer;
   begin
      loop
         select
            accept Open  do
               is_Open:=True;
               aTrap := new Trap;
               Printer.Print("Door is opened.");
            end Open;
         or
            accept Close  do
               is_Open := False;
               Printer.Print("Door is closed.");
            end Close;
         or
            terminate;
         end select;
      end loop;
   end Door;

   task body Burglar is
   aDoor: Door_Pointer;
   begin
      delay 1.0;
      House.Get_Door(aDoor);
      select
         aDoor.all.Open;
      else
         Printer.Print("Cant open the door.");
      end select;

      select
         accept Hit  do
            Printer.Print("Burglar is hitted!");
         end Hit;
      or
         delay 3.0;
      end select;


      select
         aDoor.all.Close;
      else
         Printer.Print("Cant close the door.");
      end select;
   end Burglar;

   protected body Safe_Random is
      procedure Generate(num:in out Float) is
         G:Ada.Numerics.Float_Random.Generator;
      begin
         Ada.Numerics.Float_Random.Reset(G);
         num:= Float(Ada.Numerics.Float_Random.Random(G)*4.0);
      end Generate;

      function Int_Rand5 return Integer is
         type rand5 is range 1..5;
         package Rand_Int5 is new ada.numerics.discrete_random(rand5);
         use Rand_Int5;
         gen5:Generator;
      begin
         Reset(gen5);
         return Integer(Random(gen5));
      end Int_Rand5;

   end Safe_Random;

   task body Trap is
      time:Float;
   begin
      Safe_Random.Generate(time);
      Printer.Print("Trap waits for "&Float'Image(time));
      delay Duration(time);
      select
         Burglar.Hit;
      or
         delay 0.1;

      end select;
   end Trap;

   protected body House is
      procedure Init is
      begin
         for i in 1..5 loop
            DoorList(i) := new Door(i);
         end loop;
      end Init;

      procedure Get_Door(aDoor:in out Door_Pointer) is
      begin
         aDoor:= DoorList(Integer(Safe_Random.Int_Rand5));
      end Get_Door;

   end House;







begin
   House.Init;
end Kevin4;
