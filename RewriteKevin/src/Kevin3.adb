with Ada.Text_IO,Ada.Numerics.Float_Random;use Ada.Text_IO;
procedure Kevin3 is
   protected Printer is
      procedure Print(S:in String);
   end Printer;

   task Door is
      entry Open;
      entry Close;
   end Door;
   task Burglar is
      entry Hit;
   end Burglar;
   task type Trap;

   protected Safe_Random is
      procedure Generate(num: in out Float);
   end Safe_Random;
   type Trap_Pointer is access Trap;

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
   begin
      delay 1.0;
      select
         Door.Open;
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
         Door.Close;
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
   end Safe_Random;

   task body Trap is
      time:Float;
   begin
      Safe_Random.Generate(time);
      delay Duration(time);
      Printer.Print("Trap waits for "&Float'Image(time));
      select
         Burglar.Hit;
      or
         delay 0.1;

      end select;
   end Trap;







begin
   null;
end Kevin3;
