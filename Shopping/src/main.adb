with ADA.Text_IO,ada.numerics.discrete_random;use ADA.Text_IO;
procedure Main is
   protected Printer is
      procedure printing(S: in String);
   end Printer;

   protected body Printer is
      procedure printing(S: in String) is
      begin

         Put_Line(S);
      end printing;
   end Printer;

   protected Generate is
      procedure GiveRand (time : out Float);
   end Generate;

   protected body Generate is
      procedure GiveRand(time : out Float) is
         type range2 is range 0..1;
         package Rand2 is new ada.numerics.discrete_random(range2);
         use Rand2;
         gen2:Rand2.Generator;
      begin

         Rand2.Reset(gen2);
         time := Float(Rand2.Random(gen2))/10.0;
      end GiveRand;


   end Generate;


   task shop is
      entry sport;
      entry shoes;
      entry electronics;
   end shop;

   task body shop is
   time : Float;
   begin

          Generate.GiveRand(time);
         select
            when (time>0.0) =>
               accept sport  do
                  Printer.printing("Buying in sport store!");
               end sport;

         or
            delay Duration(time);
         end select;
          Generate.GiveRand(time);
         select

            when (time>0.0) =>
               accept shoes  do
                  Printer.printing("Buying in shoes store!");
               end shoes;

         or
            delay Duration(time);
         end select;
         Generate.GiveRand(time);
         select

            when (time > 0.0) =>
               accept electronics  do
                  Printer.printing("Buying in electronics store!");
               end electronics;

         or
            delay Duration(time);

         end select;


   end shop;

   task John;
   task body John is
   begin
      delay 0.1;
      select
         shop.sport;
      else
         null;
      end select;

      delay 0.1;

      select
         shop.shoes;
      else
         null;
      end select;
      delay 0.1;

      select
         shop.electronics;
      or
         delay 0.3;
      end select;


   end John;



begin
   --  Insert code here.
   null;
end Main;
