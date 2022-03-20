with ADA.Text_IO,ada.numerics.discrete_random,Ada.Numerics.Float_Random;use ADA.Text_IO;

procedure main is
   type randRange is range 0..1;
   G:Ada.Numerics.Float_Random.Generator;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   task John ;
   protected Printer is
      procedure Printing(S:in String:=" ");
   end Printer;

   protected body Printer is
      procedure Printing(S:in String:=" ") is
      begin
         Put_Line(S);
      end Printing;
   end Printer;



   task sport is
      entry getin;
      entry close;
   end sport;

   task shoes is
      entry getin;
      entry close;
   end shoes;

   task electronics is
      entry getin;
      entry close;
   end electronics;

   task body sport is
      --- 0 close 1 open
      isOpen : Integer;
   begin
      --delay Duration(Ada.Numerics.Float_Random.Random (G)/2.0);
      reset(gen);
      isOpen := Integer(random(gen));
      Put_Line(Integer'Image(isOpen));
      while  isOpen = 1 loop
         --delay 0.1;
         select
            accept getin  do
               Put_Line("In Sport store!");
            end getin;
         or
            accept close do
               isOpen := 0;
            end Close;

         end select;
      end loop;
   end sport;



   task body shoes is
       --- 0 close 1 open
      isOpen : Integer;
   begin
     reset(gen);
      isOpen := Integer(random(gen));
      Put_Line(Integer'Image(isOpen));
      while  isOpen = 1 loop
         --delay 0.1;
         select
            accept getin  do
               Put_Line("In shoes store!");
            end getin;
         or
            accept close do
               isOpen := 0;
            end Close;

         end select;
      end loop;



   end shoes;

   task body electronics is

      isOpen : Integer;
   begin
     reset(gen);
      isOpen := Integer(random(gen));
      Put_Line(Integer'Image(isOpen));
      while  isOpen = 1 loop
         --delay 0.1;
         select
            accept getin  do
               Put_Line("In electronics store!");
            end getin;
         or
            accept close do
               isOpen := 0;
            end Close;
         end select;
      end loop;


   end electronics;

   task body John is
   begin

      delay 0.1;
     -- Put_Line("2");
      select
         sport.getin;
      or
         delay 0.1;
      end select;
      Put_Line("1");

      select
         shoes.getin;
      or
         delay 0.1;
        -- Put_Line("1");
      end select;
      Put_Line("2");
      select
         electronics.getin;
      or
         delay 0.3;
         --Put_Line("1");
      end select;

      Put_Line("3");
      sport.close;
      shoes.close;
      electronics.close;


   end John;






 begin

   null;
end main;
