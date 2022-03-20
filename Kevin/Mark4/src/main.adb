with Ada.Text_IO,Ada.Numerics.Float_Random, ada.numerics.discrete_random;use Ada.Text_IO,Ada.Numerics.Float_Random;
procedure Main is

   protected Printer is
      procedure Print(S:in String);
   end Printer;

   protected body Printer is
      procedure Print(S:in String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;


   task type Door(ID:Integer) is
      entry Open;
      entry Close;
   end Door;

   task body Door is
      Fact : Boolean := False;
   begin
      loop
         select
            accept Open do
               Fact := True;
            end Open;
            Printer.Print("Door was opened");
         or
            accept Close  do
               Fact := False;
            end Close;
            Printer.Print("Door was closed");
         or
            terminate;
         end select;
      end loop;
   end Door;

   task Burglar is
      entry Hit;
   end Burglar;

   protected Safe_Random is
      procedure Generate(D: in out Duration);
      procedure SetFloat;
   private
      Gen : Ada.Numerics.Float_Random.Generator;
      Rnd : Float ;
      Result : Float;
   end Safe_Random;

   protected body Safe_Random is
      procedure SetFloat is
      begin
         Rnd:=Ada.Numerics.Float_Random.Random(Gen);
         Result := 4.0 * Rnd;
      end SetFloat;
      procedure Generate(D: in out Duration) is
      begin
         Reset(Gen);
         Rnd:=Ada.Numerics.Float_Random.Random(Gen);
         Result := 4.0 * Rnd;
         --Put_Line(Float'Image(Result));
         D:= Duration(Result);
      end Generate;
   end Safe_Random;




   task type Trap;

   task body Trap is
      time : Duration;
   begin
      Safe_Random.Generate(time);
      Printer.Print("Trap wait for " & Duration'Image(time));
      delay time;
      select
         Burglar.Hit;
      or
         delay 0.01;
      end select;

   end Trap;


   type Trap_Pointer is access Trap;



   type Door_Pointer is access Door;

   type Doorarray is array(Integer range<>) of Door_Pointer;



   protected House is
      procedure Init;
      procedure Get_Door(aDoor : out Door_Pointer);
   private
      Doors : Doorarray(1..5);
   end House;

   type range5 is range 1..5;
   package Rand5 is new ada.numerics.discrete_random(range5);
   use Rand5;
   protected body House is
      procedure Init is
      begin
         for i in 1..5 loop
            Doors(i) := new Door(i);
         end loop;
      end Init;

      procedure Get_Door(aDoor : out Door_Pointer) is
         gen5: Rand5.Generator;
      begin
         Rand5.Reset(gen5);
         aDoor:= Doors(Integer(Rand5.Random(gen5)));
      end Get_Door;

   end House;

   task body Burglar is
      atrap : Trap_Pointer;
      adoor : Door_Pointer;
   begin
      delay 1.0;
      House.Get_Door(adoor);
      adoor.all.Open;
      atrap := new Trap;
      select
         accept Hit  do
            Printer.Print("Burglar is hit!");
         end Hit;
      or
         delay 3.0;
      end select;

      adoor.all.Close;
   end Burglar;
begin
   House.Init;
end Main;
