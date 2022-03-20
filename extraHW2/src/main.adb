with ADA.Text_IO ; use ADA.Text_IO;
with ada.numerics.discrete_random;
with Ada.Numerics.Float_Random;
procedure Main is
   G:Ada.Numerics.Float_Random.Generator;
   type String_Pointer is access String;
   type Time_Pointer is access Duration;
   task type filling is
      entry empty(time:Time_Pointer);
   end filling;
   type filling_Pointer is access filling;
   type fillingArray is array (1..5) of filling_Pointer;
   task type Car(S:String_Pointer;Time: Time_Pointer);
   type Car_Pointer is access Car;
   type CarArray is array (1..100) of Car_Pointer;
   protected Printer is
      procedure Print(S:in String);
   end Printer;

   protected station is
      entry Getin(S:String_Pointer;Time: Time_Pointer);
      procedure init;
      procedure Close;
      procedure Check;
      --procedure Open_Station;
   private
      agenda:Integer:=0;
      fillingList:fillingArray;
      hasOpen :Boolean:=  True;
   end station;


   ------------------------------Body----------------------------------
   protected body Printer is
      procedure Print(S:in String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;


   protected body station is
      entry Getin(S:String_Pointer;Time: Time_Pointer) when hasOpen is
      begin
         --Put_Line("1");
         for i in 1..5 loop
            select
               fillingList(i).all.empty(Time);
               Printer.Print("A car in!");
               agenda := agenda+1;
            else
               null;
            end select;

         end loop;
      end Getin;

      procedure init is
      begin
         hasOpen:=True;
         for i in 1..5 loop
            fillingList(i):= new filling;
         end loop;
      end init;

      procedure Close is
      begin
         hasOpen:=False;
      end Close;

      procedure Check is
         open:Boolean;
      begin
         open := False;
         for i in 1..5 loop
            select
               fillingList(i).all.empty(new Duration'(0.0));
               open := True;
            else
               null;
            end select;
         end loop;
         --Put_Line(Boolean'Image(open));
         hasOpen:=open;
         --Put_Line(Boolean'Image(open));
      end Check;


   end station;

   task body filling is
   begin
      loop
         select
            accept empty (time : in Time_Pointer) do
               delay time.all;
            end empty;
         or
            terminate;
         end select;
      end loop;
   end filling;




   task body Car is
      type rand3 is range 1..3;
      package Rand_Int3 is new ada.numerics.discrete_random(rand3);
      use Rand_Int3;
      gen3 : Generator;
      num:Integer;
   begin
      delay 0.1;
      Reset(gen3);
      num:= Integer(Random(gen3));
      --Put_Line("1");
      if(num = 1 )then
         select
            station.Getin(S,Time);
         else
            Printer.Print(S.all&" cant in and left");
         end select;
         end if;
      if(num = 2) then
         select
            station.Getin(S,Time);
         or
            delay 0.5;
            Printer.Print(S.all&" cant in and left");
         end select;
      end if;

      if(num = 3) then

         station.Getin(S,Time);



      end if;

   exception
      when Tasking_Error =>
         Put_Line("station closed!");

   end Car;

   CarList:CarArray;
   task check;

   task body check is
   begin
      for i in 1..500 loop
         station.Check;
      end loop;
   end check;



begin
   station.init;
   delay 0.5;
   for i in 1..20 loop
      Ada.Numerics.Float_Random.Reset(G);
      CarList(i):= new Car(new String'("Car"&Integer'Image(i)),new Duration'(Duration(Float(Ada.Numerics.Float_Random.Random(G))/2.0+0.01)));

   end loop;

   delay 10.0;
   station.Close;
end Main;
