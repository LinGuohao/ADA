with Ada.Text_IO,ada.numerics.discrete_random; use ada.Text_IO;

procedure Mark3 is
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


   task sport is
      entry Getin;
      entry Close;
   end sport;

    task shoes is
      entry Getin;
      entry Close;
   end shoes;

    task electronics is
      entry Getin;
      entry Close;
   end electronics;

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
               Printer.printing("Somebody In sport store!");
               cnt:= cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&" items sold in sport store!");
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
               Printer.printing("Somebody In shoes store!");
               cnt:= cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&" items sold in shoes store!");
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
               Printer.printing("Somebody In electronics store!");
               cnt := cnt + 1;
            end Getin;
         or
            accept Close  do
               open := 0;
               Printer.printing(Integer'Image(cnt)&" items sold in electronics!");
            end Close;

         end select;
      end loop;
   end electronics;

   task body customer is
   begin
      Reset(gen5);
      delay Duration(Float(Random(gen5))/20.0);
      select
         sport.Getin;
         delay 0.1;
      or
         delay 0.1;
         Printer.printing(name.all & " can not go in Sport store");
      end select;

      select
         shoes.Getin;
         delay 0.1;
      or
         delay 0.1;
         Printer.printing(name.all & " can not go in shoes store");
      end select;

      select
         electronics.Getin;
         delay 0.1;
      or
         delay 0.3;
         Printer.printing(name.all & " can not go in electronics store");
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
   delay 1.0;
      sport.Close;
      shoes.Close;
      electronics.Close;
   exception
   when Tasking_Error =>
      Put_Line("Task error!");

end Mark3;
