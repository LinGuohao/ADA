with ada.numerics.discrete_random, ada.Text_IO,Ada.Calendar,Ada.Numerics.Float_Random; use Ada.Text_IO,Ada.Numerics.Float_Random;
procedure Main is


   type randRange is new Integer range 1..3;
   package Rand_int is new Ada.Numerics.Discrete_Random(randRange);
   use Rand_int;
   gen:Rand_int.Generator;
   --num:randRange;
   type Pstring is access String;

   type PD is access Float;
   protected type printingOBJ is
      entry CantIn(ps:Pstring);
      entry SomebodyIn(s:String);
      entry Closed (s:String);
   end printingOBJ;

   protected body printingOBJ is
      entry CantIn(ps:Pstring) when true is
         begin
         Put_Line(ps.all & " couldn't get into Hospital");
      end CantIn;

      entry SomebodyIn(S: String) when true is
      begin
         Put_Line(S);
      end SomebodyIn;

      entry Closed(S:String) when true is
      begin
         Put_Line(S);
      end Closed;


   end printingOBJ;

   printing : printingOBJ;


   task type hospital(D:PD;index:Integer) is
      entry TryIn ;
   end hospital;






   task body hospital is
      sum : Integer := 0;
      EndTime : Float:=0.9;
      StartTime : Float:= 0.0;
      isopen : Boolean := True;

   begin
      delay Duration(D.all);
      while(isopen) loop
         --Put_Line("Here");
         select
               accept TryIn  do
               sum:= sum+1;
               delay 0.1;
               StartTime :=StartTime+ 0.1;

            end TryIn;
         or
            delay 0.1;
             StartTime :=StartTime+ 0.1;
         end select;

            --Put_Line("Here");
         if(Float(StartTime) >= Float(EndTime)) then
            isopen := False;
            declare
               S:String := "Hospital " & Integer'Image(index) & " closed, served " & Integer'Image(sum) &" people";
               begin
               printing.Closed(S);
               end ;
         end if;

         end loop;

      end hospital;

   type Phospital is access hospital;

   hospitals: array (1..3) of Phospital;

   task type Patient(name :PString);

   task body Patient is
      num : randRange;
      isin : Boolean := False;
      index : Integer;
      tmp : Integer;

   begin
      reset(gen);
      num := Random(gen);
      index := Integer(num);
      tmp := 1;
      delay 1.0;
      while tmp < 3 and isin = False loop
      select
         hospitals(index).all.TryIn;
            isin := True;
            declare
               s:String:=name.all &" entered, The Hospitals number is" & Integer'Image(index);
               begin
               printing.SomebodyIn(s);
               end;
      else
         delay 0.5;
         tmp := tmp + 1;
      end select;

      end loop;

      if(isin = False) then
         printing.CantIn(name);
      end if;




   end Patient;
   type Ppatients is access Patient;
   patients : array(1..20) of Ppatients;
   D1 : PD;
   D2: PD;
   D3 : PD;
   A: Pstring;
   B: Pstring;
   C: Pstring;
   DS: Pstring;
   E: Pstring;
   F: Pstring;
   G: Pstring;
   H: Pstring;
   I: Pstring;
   GS: Pstring;
   K: Pstring;
   L: Pstring;
   M: Pstring;
   N: Pstring;
   O: Pstring;
   P: Pstring;
   Q: Pstring;
   R: Pstring;
   S: Pstring;
   T: Pstring;
   GenFloat : Ada.Numerics.Float_Random.Generator;
   Rnd : constant Float:= Ada.Numerics.Float_Random.Random (GenFloat);


begin

   D1 := new Float'(Rnd);
   D2 := new Float'(Rnd+0.2);
   D3 := new Float'(Rnd+0.4);
   hospitals(1):= new hospital(D1,1);
   hospitals(2) := new hospital(D2,2);
   hospitals(3):= new hospital(D3,3);
   A:= new String'("A");
   B:= new String'("B");
   C:= new String'("C");
   DS:= new String'("D");
   E:= new String'("E");
   F:= new String'("F");
   GS:= new String'("G");
   H:= new String'("H");
   I:= new String'("I");
   G:= new String'("G");
   K:= new String'("K");
   L:= new String'("L");
   M:= new String'("M");
   N:= new String'("N");
   O:= new String'("O");
   P:= new String'("P");
   Q:= new String'("Q");
   R:= new String'("R");
   S:= new String'("S");
   T:= new String'("T");
   patients(1) := new patient(A);
   patients(2) := new patient(B);
   patients(3) := new patient(C);
   patients(4) := new patient(DS);
   patients(5) := new patient(E);
   patients(6) := new patient(F);
   patients(7) := new patient(G);
   patients(8) := new patient(H);
   patients(9) := new patient(I);
   patients(10) := new patient(GS);
   patients(11) := new patient(K);
   patients(12) := new patient(L);
   patients(13) := new patient(M);
   patients(14) := new patient(N);
   patients(15) := new patient(O);
   patients(16) := new patient(P);
   patients(17) := new patient(Q);
   patients(18) := new patient(R);
   patients(19) := new patient(S);
   patients(20) := new patient(T);



end Main;
