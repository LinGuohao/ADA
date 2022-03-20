with ADA.Text_IO,Ada.Numerics.Float_Random,ada.numerics.discrete_random; use ADA.Text_IO;
procedure Main is
   G:Ada.Numerics.Float_Random.Generator;
   type randRange3 is range 1..3;
   package Rand_Int is new ada.numerics.discrete_random(randRange3);
   use Rand_Int;
   gen3 : Generator;
   type Time_Pointer is access Duration;
   type String_Pointer is access String;

   protected printer is
      procedure printing(S: in String :=" " );
   end printer;

   protected body printer is
      procedure printing(S: in String := " ") is
      begin
         Put_Line(S);
      end printing;
   end printer;

   task type Patient(name:String_Pointer);
   task type hospital(time : Time_Pointer)is
      entry Getin(name:in String);
   end hospital;

   type hospital_Pointer is access hospital;
   type hospitalarray is array (1..3) of hospital_Pointer;
   hospitalList : hospitalarray;
   type Patient_Pointer is access Patient;
   type Patientarray is array (1..20) of Patient_Pointer;
   PatientList : Patientarray;
   ------------------------- body -------------------
   task body hospital is
      cnt: Integer:=0;
      Start:Float := 0.0;
      is_Open :Boolean:= True;
   begin
      delay time.all;
      while Start <= 1.0 loop
         select
            accept Getin(name : in String)  do
               --printer.printing(name &" get in a hospital");
               delay 0.1;
               Start:=Start+0.1;
               cnt := cnt + 1;
            end Getin;
         or
            delay 0.1;
            Start:= Start+0.1;
         end select;
      end loop;
      is_Open:=False;
      printer.printing("Hospital closed, " &Integer'Image(cnt) &" patients served.");
  end hospital;

   task body Patient is
      is_in:Boolean:= False;
      index : Integer;
   begin
      Reset(gen3);
      index := Integer(Random(gen3));
      delay 0.1;
      select
         hospitalList(index).all.Getin(name.all);
         is_in:=True;
         printer.printing("Patient name is " & name.all &  "  Hospital number is "&Integer'Image(index));
      else
         is_in:=False;
      end select;

      if(is_in = False) then
         delay 0.5;
         select
            hospitalList(index).all.Getin(name.all);
            is_in:=True;
            printer.printing("Patient name is " & name.all &  "  Hospital number is "&Integer'Image(index));
         else
            is_in:=False;
         end select;
      end if;

      if(is_in = False) then
         printer.printing(name.all &"couldn't get into Hospital");
      end if;
   end Patient;


   time : Float;



  begin
   Ada.Numerics.Float_Random.Reset(G);
   time := Ada.Numerics.Float_Random.Random(G)/5.0;
   for i in 1..3 loop
      hospitalList(i) := new hospital(new Duration'(Duration(time)));
      time:= time + 0.2;
   end loop;

   for i in 1..20 loop
      PatientList(i):= new Patient(new String'("P"&Integer'Image(i)));
   end loop;


end Main;
