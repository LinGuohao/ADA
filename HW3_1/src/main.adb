with ADA.Text_IO,Ada.Numerics.Float_Random,ada.numerics.discrete_random; use ADA.Text_IO;
procedure Main is
   protected Printer is
      procedure printing (S: in String);
   end Printer;
   protected Geneator is
      function RandomInt return Integer;
      function RandomTime return Float;
   end Geneator;

   type StringPointer is access String;
   type timePointer is access Duration;
   task type Patient(name:StringPointer);
   task type Hospital(time:timePointer) is
      entry Goin;
   end Hospital;
   type HospitalPointer is access Hospital;
   type HospitalArray is array (1..3) of HospitalPointer;
   HospitalList : HospitalArray;
   type PatientPointer is access Patient;
   type PatientArray is array (1..20) of PatientPointer;
   PatientList : PatientArray;



   -----------------------------Body----------------------------

   protected body Printer is
      procedure printing(S:in String) is
      begin
         Put_Line(S);
      end printing;
   end Printer;

   protected body Geneator is
      function RandomInt return Integer is
         type randRange is range 1..3;
         package Rand_Int is new ada.numerics.discrete_random(randRange);
         use Rand_Int;
         gen : Generator;
      begin
         reset(gen);
         return Integer(random(gen));
      end RandomInt;

      function RandomTime return Float is
         G:Ada.Numerics.Float_Random.Generator;
      begin
         Ada.Numerics.Float_Random.Reset(G);
         return Ada.Numerics.Float_Random.Random(G);
      end RandomTime;
   end Geneator;

   task body Patient is
      is_in:Boolean:= False;
      num:Integer;
   begin
      num:=Geneator.RandomInt;
      delay 1.0;
      select
         HospitalList(num).all.Goin;
         Printer.printing(name.all&" got into" &Integer'Image(num)& "th hospital");
         is_in := True;
      else
         Printer.printing(name.all&" will try second time.");
         is_in :=False;
      end select;

      if(is_in = False) then
         delay 0.5;
         select
            HospitalList(num).all.Goin;
            Printer.printing(name.all&" got into" &Integer'Image(num)& "th hospital on the second attempt");
         else
            Printer.printing(name.all&" couldn't get into Hospital");
         end select;
      end if;
   end Patient;

   task body Hospital is
      Is_Open:Boolean:=False;
      cunt:Integer:=0;
      start:Duration:=0.0;
      close:Duration:=1.0;
   begin
      delay time.all;
      Is_Open := True;
      start:=0.0;
      while Is_Open = True loop
         select
            accept Goin do
               delay 0.1;
               cunt:= cunt + 1;
               start := start + 0.1;
            end Goin;
         or
            delay 0.1;
            start := start + 0.1;
         end select;

         if(start >= close) then
            Is_Open := False;
         end if;

      end loop;

      Printer.printing(Integer'Image(cunt)&" patients served");

   end Hospital;
   atime :Float;
begin
   for i in 1..20 loop
      PatientList(i) := new Patient(new String'(Integer'Image(i)&"th Patient"));
   end loop;
   atime:= Geneator.RandomTime/3.0;
   for i in 1..3 loop
      HospitalList(i):= new Hospital(new Duration'(Duration(atime)));
      atime := atime + 0.2;
   end loop;


end Main;
