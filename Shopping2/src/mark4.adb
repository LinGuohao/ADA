with Ada.Text_IO,ada.numerics.discrete_random; use ada.Text_IO;

procedure Mark4 is
   type Rand2 is range 0..1;
   package Rand_Int2 is new ada.numerics.discrete_random(Rand2);
   type Rand5 is range 0..6;
   package Rand_Int5 is new ADA.Numerics.Discrete_Random(Rand5);
   use Rand_Int5;
   use Rand_Int2;
   gen2 : Rand_Int2.Generator;
   gen5: Rand_Int5.Generator;
   type String_Pointer is access String;
   task type customer(name : String_Pointer) ;
   protected Printer is
      procedure printing(S: in String);
   end Printer;

   protected body Printer is
      procedure printing(S : in String) is
      begin
         Put_Line(S);
      end printing;
   end Printer;


   task type sport(name :String_Pointer) is
      entry Getin;
      entry Close;
   end sport;

    task type shoes (name :String_Pointer)is
      entry Getin;
      entry Close;
   end shoes;

    task type electronics(name :String_Pointer) is
      entry Getin;
      entry Close;
   end electronics;

   type sport_Pointer is access sport;
   type shoes_Pointer is access shoes;
   type electronics_Pointer is access electronics;
   type sportarray is array (1..2) of sport_Pointer;
   type shoesarray is array (1..2) of shoes_Pointer;
   type electronicsarray is array (1..2)of electronics_Pointer;

   task body sport is
      open : Integer;
      cnt : Integer;
   begin
      reset(gen2);
      reset(gen5);
      open := 1;
      cnt:= 0;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("Somebody In "&name.all&" store!");
               cnt:= cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&"items sold in "&name.all&" store!");
            end Close;
         or
              delay 0.1;
         end select;
      end loop;
   end sport;

   task body shoes is
      open : Integer;
      cnt : Integer;
   begin
      cnt := 0;
      reset(gen2);
      reset(gen5);
      open := 1;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("Somebody In "&name.all&" store!");
               cnt:= cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&"items sold in " &name.all&" store!");
            end Close;
         or
              delay 0.1;
         end select;
      end loop;

   end shoes;


   task body electronics is
      open : Integer;
      cnt : Integer;
   begin
      reset(gen2);
      reset(gen5);
      open := 1;
      cnt := 0;
      delay Duration(Float(Random(gen5))/10.0);
      while open=1 loop
         select
            accept Getin  do
               Printer.printing("Somebody In "& name.all& " store!");
               cnt := cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&"items sold in " &name.all& "!");
            end Close;
         or
              delay 0.1;
         end select;
      end loop;
   end electronics;
    sport_stores : sportarray;
   shoes_stores : shoesarray;
   electronics_stores : electronicsarray;


   task body customer is
      index1: Integer;
      index2:Integer;
      index3:Integer;

   begin
      Reset(gen5);
      delay Duration(Float(Random(gen5))/20.0);
      Reset(gen2);
      index1 := Integer(Random(gen2))+1;
      index2 := Integer(Random(gen2))+1;
      index3 := Integer(Random(gen2))+1;
      select
         sport_stores(index1).Getin;
         delay 0.1;
      else
         Printer.printing(name.all & " go to next store");
      end select;

      select
         shoes_stores(index2).Getin;
         delay 0.1;
      else
         --delay 0.1;
         Printer.printing(name.all & " go to next store");
      end select;

      select
         electronics_stores(index3).Getin;
         delay 0.1;
      else
         --delay 0.3;
         Printer.printing(name.all & " go home");
      end select;


   end customer;

   a : customer(new String'("a"));
   b : customer(new String'("b"));
   c : customer(new String'("c"));
   d : customer(new String'("d"));
   e : customer(new String'("e"));
   f : customer(new String'("f"));
   g : customer(new String'("g"));
   h : customer(new String'("h"));
   i : customer(new String'("i"));
   j : customer(new String'("j"));
   k : customer(new String'("k"));
   l : customer(new String'("l"));
   m : customer(new String'("m"));
   n : customer(new String'("n"));
   o : customer(new String'("o"));









begin
   --  Insert code here.
   for i in 1..2 loop
      sport_stores(i) := new sport(new String'("sport"&Integer'Image(i)));
   end loop;
   for i in 1..2 loop
      shoes_stores(i) := new shoes(new String'("shoes"&Integer'Image(i)));
   end loop;

   for i in 1..2 loop
       electronics_stores(i) := new electronics(new String'("electronics"&Integer'Image(i)));
   end loop;


   delay 1.0;
   for i in 1..2 loop
      sport_stores(i).all.Close;
      shoes_stores(i).all.Close;
      electronics_stores(i).all.Close;
   end loop;


   exception
   when Tasking_Error =>
      Put_Line("Task error!");

end Mark4;
