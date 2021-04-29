with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

   type plate is access String;
   type time is access duration;
   A: plate;
   B: plate;
   C: plate;
   D: time;
   E: time;
   F: time;
   type Color is (Red, Green,Yellow);


   protected lamp is
      entry pass;
      procedure Change;
      function isCoulour return Color;
   private
      light:Color:= Red;
   end lamp;

   protected body lamp is
      entry pass when light = Green is
      begin
         Put_Line("A car is passed");
      end pass;

      procedure Change is
      begin
         if light = Green then
            light := Red;
         elsif light = Red then
            light:= Green;
         end if;
         Put_Line(Color'Image(light));
      end Change;

      function isCoulour return Color is
      begin
         return light;
      end isCoulour;

   end lamp;

   Task scheduler;
   Task body scheduler is
      begin
      for i in 1..3 loop
         lamp.Change;
         delay 2.0;
      end loop;
      for i in 1..3 loop
         lamp.Change;
         delay 1.5;
      end loop;

      for i in 1..3 loop
         lamp.Change;
         delay 0.5;
      end loop;
   end scheduler;

   Task type Car(p:plate;t:time);

   Task body Car is
      passed : Boolean := False;
   begin
      delay t.all;
      while not passed loop
         select
            lamp.pass;
            Put_Line(p.all &" Passed");
            passed := True;
         or
            delay 0.2;
            Put_Line("waits");
         end select;
      end loop;
   end Car;
   type Pcar is access Car;
   Cars: array(1..3) of Pcar;

begin
   A:= new String'("abc-123");
   B:= new String'("def-456");
   C:= new String'("ghj-789");
   D:= new Duration'(3.0);
   E:= new Duration'(6.0);
   F:= new Duration'(9.0);
   Cars(1) := new Car(A,D);
   Cars(2) := new Car(B,E);
   Cars(3) := new Car(C,F);



end Main;
