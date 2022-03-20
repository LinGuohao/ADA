with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is
   type Color is (red, yellow, green);

   protected lamp is
      entry pass;
      function isColor return Color;
      procedure Change;
      private
      light: Color:=red;
   end lamp;

   protected body lamp is
      entry pass when light=green is begin
         Put_Line("Cars can pass");
         end pass;
      function isColor return Color is
      begin
         return light;
      end isColor;

      procedure Change is
      begin
         Put_Line(Color'Image(light));
         if light = green then
            light:=red;
         else
            light:=Color'Succ(light);
         end if;


      end Change;
   end lamp;

   type strPtr is access String;
   type durPtr is access Duration;

   task type car(plate:strPtr;time:durPtr);

   task body car is
      passed:Boolean:=False;
   begin
      delay time.all;
      while not passed loop
         select
            lamp.pass;
            passed:=true;
            Put_Line(plate.all & " has paased");
         or
            delay 0.2;
         end select;

      end loop;

   end car;

   type carPtr is access car;


   carArr: array(1..3) of carPtr;




   task scheduler;
   task body scheduler  is
   begin
      for i in 1..3 loop
         lamp.Change;
         delay 2.0;
         lamp.Change;
         delay 1.5;
         lamp.Change;
         delay 0.5;

      end loop;

   end scheduler;






begin
   carArr(1):=new car(new String'("1"),new Duration'(1.0));
   carArr(2):=new car(new String'("2"),new Duration'(10.0));
   carArr(3):=new car(new String'("3"),new Duration'(5.3));
end Main;
