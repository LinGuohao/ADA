with Ada.Text_IO,ada.numerics.discrete_random; use ada.Text_IO;

procedure Main is
   type Rand2 is range 0..1;
   package Rand_Int2 is new ada.numerics.discrete_random(Rand2);
   type Rand5 is range 0..6;
   package Rand_Int5 is new ADA.Numerics.Discrete_Random(Rand5);
   use Rand_Int5;
   use Rand_Int2;
   gen2 : Rand_Int2.Generator;
   gen5: Rand_Int5.Generator;
   task John;
   protected Printer is
      procedure printing(S: in String);
   end Printer;

   protected body Printer is
      procedure printing(S : in String) is
      begin
         Put_Line(S);
      end printing;
   end Printer;


   task sport is
      entry Getin;
      entry Close;
   end sport;

    task shoes is
      entry Getin;
      entry Close;
   end shoes;

    task electronics is
      entry Getin;
      entry Close;
   end electronics;

   task body sport is
      open : Integer;
   begin
      reset(gen2);
      reset(gen5);
      open := 1;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("In sport store!");
            end Getin;
         or
            accept Close  do
               open := 0;
            end Close;
         or
              delay 0.1;
         end select;
      end loop;
   end sport;

   task body shoes is
      open : Integer;
   begin
      reset(gen2);
      reset(gen5);
      open := 1;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("In shoes store!");
            end Getin;
         or
            accept Close  do
               open := 0;
            end Close;
         or
              delay 0.1;
         end select;
      end loop;

   end shoes;


   task body electronics is
      open : Integer;
   begin
      reset(gen2);
      reset(gen5);
      open := 1;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("In electronics store!");
            end Getin;
         or
            accept Close  do
               open := 0;
            end Close;
         or
              delay 0.1;
         end select;
      end loop;
   end electronics;

   task body John is
   begin
      delay 0.1;
      select
         sport.Getin;
         delay 0.1;
      or
         delay 0.1;
         Printer.printing("Sport store not open");
      end select;

      select
         shoes.Getin;
         delay 0.1;
      or
         delay 0.1;
         Printer.printing("Shoes store not open");
      end select;

      select
         electronics.Getin;
         delay 0.1;
      or
         delay 0.3;
         Printer.printing("electronics store not open");
      end select;

      sport.Close;
      shoes.Close;
      electronics.Close;

   end John;











begin
   --  Insert code here.
   null;
   exception
   when Tasking_Error =>
      Put_Line("Task error!");

end Main;
