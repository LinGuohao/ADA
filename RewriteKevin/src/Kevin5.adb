with Ada.Text_IO,Ada.Numerics.Float_Random;use Ada.Text_IO;
with ada.numerics.discrete_random;
procedure Kevin5 is
   protected Printer is
      procedure Print(S:in String);
   end Printer;

   task type Door(ID:Integer) is
      entry Open;
      entry Close;
      entry Set_Trap;
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
      procedure Get_Door(Door_ID:Integer;aDoor:out  Door_Pointer);
   private
      DoorList : DoorArray;
   end House;

   task Kevin is
      entry Catch;
   end Kevin;


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
      has_Trap: Boolean:=False;
   begin
      loop
         select
            accept Open  do
               is_Open:=True;
               -- Put_Line(Boolean'Image(has_Trap));
               Printer.Print("Door is opened.");
               if(has_Trap = True)then
                  aTrap := new Trap;
               end if;

            end Open;
         or
            accept Close  do
               is_Open := False;
               Printer.Print("Door is closed.");
            end Close;
         or
            accept Set_Trap  do
               has_Trap := True;
            end Set_Trap;
         or
            terminate;
         end select;
      end loop;
   end Door;

   task body Burglar is
      aDoor: Door_Pointer;
      is_hitted:Boolean:=False;
   begin
      delay 3.5;
      House.Get_Door(aDoor);
      select
         aDoor.all.Open;
      else
         Printer.Print("Cant open the door.");
      end select;

      select
         accept Hit  do
            Printer.Print("Burglar is hitted!");
            is_hitted:=True;
         end Hit;
      or
         delay 3.0;
      end select;


      select
         aDoor.all.Close;
         --Put_Line(Boolean'Image(is_hitted));
      else
         Printer.Print("Cant close the door.");

      end select;

      if(is_hitted = False) then
         --Put_Line("Here");
         Kevin.Catch;
      end if;

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

      procedure Get_Door(Door_ID:Integer;aDoor: out Door_Pointer) is
      begin
         aDoor := DoorList(Door_ID);
      end Get_Door;

   end House;

   task body Kevin is
      aDoor:Door_Pointer;
   begin
      delay 0.01;
      for i in 1..5 loop
         House.Get_Door(i,aDoor);
         --Put_Line(Integer'Image(i));
         aDoor.all.Set_Trap;
         select
            accept Catch  do
               Printer.Print("Kevin be caught!");
            end Catch;
         else
            delay 1.0;
         end select;
      end loop;

      select
         accept Catch  do
            Printer.Print("Kevin be caught!");
         end Catch;
      or
         terminate;
      end select;
   end Kevin;









begin
   House.Init;
end Kevin5;
