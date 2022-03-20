with Ada.Text_IO,Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure Main is

   package myBool is new Ada.Numerics.Discrete_Random(Boolean);
   g:myBool.Generator;

   subtype myRange is Positive range 1..2;
   package myInt is new Ada.Numerics.Discrete_Random(myRange);
   l:myInt.Generator;


   protected Printer is
      procedure Print(s:String);
   end Printer;

   protected body Printer is
      procedure Print(s:String) is
      begin
         Put_Line(s);
      end Print;
   end Printer;

   type Str is access String;
   task type Customer(name:Str);

   task type Sport is
      entry Meet;
      entry Close;
   end Sport;

   task type Shoes is
      entry Meet;
      entry Close;
   end Shoes;
   task type Electronic is
      entry Meet;
      entry Close;
   end Electronic;

   task body Shoes is
      isOpen:Boolean:=False;
      shouldD:Boolean;
      cnt:Natural:=0;
   begin
      myBool.Reset(g);
      shouldD := myBool.Random(g);

      if shouldD then
         delay 0.1;
      end if;

      isOpen:=True;

      while isOpen loop
         select
            accept Meet  do
               cnt:=cnt+1;
               delay 0.1;
            end Meet;

         or
            accept Close  do
               isOpen:=false;
            end Close;

         or
            delay 0.2;
         end select;

         --if not John'Callable then
           -- exit;
         --end if;


      end loop;

      Printer.Print("Shoes got "&cnt'Image&" customers");

   end Shoes;


   task body Sport is
      isOpen:Boolean:=False;
      shouldD:Boolean;
      cnt:Natural:=0;
   begin
      myBool.Reset(g);
      shouldD := myBool.Random(g);

      if shouldD then
         delay 0.1;
      end if;

      isOpen:=True;
      while isOpen loop
         select
            accept Meet  do
               cnt:=cnt+1;
               delay 0.1;
            end Meet;
         or

            accept Close  do
               isOpen:=false;
            end Close;

         or
            delay 0.2;

         end select;

        -- if not John'Callable then
          --  exit;
         --end if;

      end loop;

      Printer.Print("Sport got "&cnt'Image&" customers");
   end Sport;


   task body Electronic is
      isOpen:Boolean:=False;
      shouldD:Boolean;
      cnt:Natural:=0;
   begin
      myBool.Reset(g);
      shouldD := myBool.Random(g);

      if shouldD then
         delay 0.1;
      end if;

      isOpen:=True;
      while isOpen loop
         select
            accept Meet  do
               cnt:=cnt+1;
               delay 0.1;
            end Meet;
         or
            accept Close  do
               isOpen:=false;
            end Close;
         or
            delay 0.2;

         end select;
        -- if not John'Callable then
          --  exit;
         --end if;


      end loop;

      Printer.Print("Electronic got "&cnt'Image&" customers");

   end Electronic;

   type shoePtr is access Shoes;
    sharr : array(1..2) of shoePtr;

   type sprotPtr is access Sport;
    sparr : array(1..2) of sprotPtr;
   type ePtr is access Electronic;
   earr : array(1..2) of ePtr;


   task body Customer is
      rand1:myRange;
      rand2:myRange;
      rand3:myRange;
   begin
      myInt.Reset(l);
      rand1:=myInt.Random(l);
      myInt.Reset(l);
      rand2:=myInt.Random(l);
      myInt.Reset(l);
      rand3:=myInt.Random(l);
      delay 0.1;
      select
         sparr(rand1).all.Meet;
         Printer.Print(name.all & " went into Sport store");
      else

         Printer.Print("The Sport Store didnt open for 1 minute so "&name.all &" Went to Shoes");
      end select;
      select
         sharr(rand2).Meet;
         Printer.Print(name.all& " went into SHoes store");
      else

         Printer.Print("The Shoes Store didnt open for 1 minute so "&name.all&" Went to Electronic");
      end select;
      select
         earr(rand3).Meet;
         Printer.Print(name.all &" went into Electronic store");
      --or
      --delay 0.3;
      else

         Printer.Print("The Electronic Store didnt open for 3 minute so "&name.all&" Went home");
      end select;

   end Customer;



   a:Customer(new String'("a"));
   ab:Customer(new String'("ab"));
   ac:Customer(new String'("ac"));
   ad:Customer(new String'("ad"));
   ae:Customer(new String'("ae"));
   af:Customer(new String'("af"));
   ag:Customer(new String'("ag"));
   ah:Customer(new String'("ah"));
   ai:Customer(new String'("ai"));
   aj:Customer(new String'("aj"));
   ak:Customer(new String'("ak"));
   al:Customer(new String'("al"));
   am:Customer(new String'("am"));
   an:Customer(new String'("an"));
   ao:Customer(new String'("ao"));




begin

   for i in 1..2 loop
      sparr(i):=new Sport;
      sharr(i):=new Shoes;
      earr(i):=new Electronic;
   end loop;

   delay 2.0;
   for i in 1..2 loop
      sparr(i).Close;
      sharr(i).Close;
      earr(i).Close;
   end loop;

end Main;
