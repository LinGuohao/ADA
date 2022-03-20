with Ada.Text_IO;use Ada.Text_IO;
procedure Main is
   type Colours is ( red, yellow, green);
   task scheduler ;
   type String_Pointer is access String;
   type Time_Pointer is access Duration;
   task type Car(plate:String_Pointer;time:Time_Pointer);
   type Car_Pointer is access Car;
   protected Lamp is
      procedure Change;
      function isCoulour return Colours;
      entry Pass;
   private
      light: Colours := red;
   end Lamp;

   protected body Lamp is
      procedure Change is
      begin
         if(light = red) then
            light:= yellow;
         elsif(light = yellow) then
            light := green;
         elsif(light = green) then
            light := red;
         end if;
         Put_Line(Colours'Image(light));
      end Change;

      function isCoulour return Colours is
      begin
         return light;
      end isCoulour;

      entry Pass
        when light = green is
      begin
         Put_Line("A car passed!");
      end Pass;
   end Lamp;

   task body scheduler is
   begin
      for i in 1..3 loop
         Lamp.Change;
         delay 2.0;
      end loop;
      for i in 1..3 loop
         Lamp.Change;
         delay 1.5;
      end loop;
      for i in 1..3 loop
         Lamp.Change;
         delay 0.5;
      end loop;
   end scheduler;

   task body Car is
   passed : Boolean;
   begin
      passed := False;
      delay time.all;
   while passed = False loop
      select
         Lamp.Pass;
         Put_Line(plate.all &" is passed");
         passed := True;
      or
         delay 0.2;
      end select;
      end loop;

   exception
      when Tasking_Error =>
         Put_Line(plate.all&" Today cant pass");
   end Car;

   Car1 : Car_Pointer;
   Car2: Car_Pointer;
   Car3 : Car_Pointer;




begin
   Car1:= new Car(new String'("Car1"),new Duration'(1.0));
   Car2:= new Car(new String'("Car2"),new Duration'(1.2));
   Car3:= new Car(new String'("Car3"),new Duration'(1.3));





end Main;
