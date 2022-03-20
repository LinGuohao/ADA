with Ada.Text_IO,ada.numerics.discrete_random;use ADA.Text_IO;
procedure Main is
   type String_Pointer is access String;
   type Marketarray is array (1..10,1..10) of Boolean;
   task type customer(name:String_Pointer; is_infected:Boolean);
   protected generators is
      function Int_Rand4 return Integer;
      function Int_Rand10 return Integer;
      procedure move(x:in out Integer;y : in out Integer);
   end generators;
   protected monitor is
      procedure printing(S:in String);
   end monitor;
   protected Market_area is
      procedure init;
      function percent return Integer;
      entry GetIn(is_infected:in out Boolean; x:in Integer;y :in Integer);
      procedure Close;
      function getNum return Integer;
   private
      area: Marketarray;
      Is_Open:Boolean := True;
      num:Integer:=5;
   end Market_area;

   type customer_Pointer is access customer;
   type customerArray is array (1..5) of customer_Pointer;

   ------------------------- body -----------------------------
   task body customer is
      x:Integer;
      y:Integer;
      infected:Boolean;
   begin
      infected := is_infected;
      x:= generators.Int_Rand10;
      y:= generators.Int_Rand10;
      for i in 1..4 loop
         select
            Market_area.GetIn(infected,x,y);
         else
            null;
         end select;
         generators.move(x,y);
         delay 0.5;
      end loop;
   end customer;



   protected body generators is
      function Int_Rand4 return Integer is
         type rand4 is range 1..4;
         package Rand_Int4 is new ada.numerics.discrete_random(rand4);
         use Rand_Int4;
         gen4: Rand_Int4.Generator;
         --num:Integer;
      begin
         Reset(gen4);
         return Integer(Random(gen4));
      end Int_Rand4;

      function Int_Rand10 return Integer is
         type rand10 is range 1..10;
         package Rand_Int10 is new ada.numerics.discrete_random(rand10);
         use Rand_Int10;
         gen10 : Rand_Int10.Generator;
      begin
         Reset(gen10);
         return Integer(Random(gen10));
      end Int_Rand10;

      procedure move(x:in out Integer;y : in out Integer) is
         newX:Integer;
         newY:Integer;
         num: Integer;
         is_OK:Boolean;
      begin
         is_OK:=False;
         newX:= x;
         newY:=y;
         while is_OK = False loop
            num:= Int_Rand4;
            if(num=1 and y - 1 >=0) then
               y:=y -1;
               is_OK := True;
            elsif(num = 2 and y+1<=10) then
               y:=y+1;
               is_OK := True;
            elsif(num = 3 and x-1>=0) then
               x:=x-1;
               is_OK := True;
            elsif(num = 4 and x + 1 <=10) then
               x:=x+1;
               is_OK := True;
            end if;
         end loop;
      end move;
   end generators;

   protected body monitor is
      procedure printing(S:in String) is
      begin
         Put_Line(S);
      end printing;

   end monitor;

   protected body Market_area is
      procedure init is
      begin
         Is_Open:=True;
         for i in area'Range(1) loop
            for j in area'Range(2) loop
               area(i,j) := False;
            end loop;
         end loop;
      end init;

      function percent return Integer is
      cnt:Integer;
      begin
         cnt := 0;
         for i in area'Range(1) loop
            for j in area'Range(2) loop
               if(area(i,j) = True) then
                  cnt := cnt + 1;
               end if;
            end loop;
         end loop;

         return cnt;
      end percent;


      entry GetIn(is_infected:in out Boolean; x:in Integer;y :in Integer) when Is_Open=True is
      begin
         if(is_infected = True) then
            area(x,y):=True;
         end if;

         if(is_infected = False and area(x,y) = True) then
            is_infected:=True;
            monitor.printing("Somebody is infected");
            num:=num+1;
         end if;
      end GetIn;

      procedure Close is
      begin
         Is_Open:=False;
      end Close;

      function getNum return Integer is
      begin
         return num;
      end getNum;


   end Market_area;



   customerList : customerArray;

   cnt:Integer;
   timer:Float;

   procedure Check(customerList:in out customerArray;cnt:in out Integer) is
   begin
      for i in 1..5 loop
         if(not customerList(i).all'Callable) then
            cnt := cnt + 1;
            customerList(i) := new customer(new String'("customer"&Integer'Image(cnt)),False);
            monitor.printing("customer"&Integer'Image(cnt)&" get in the Market.");
         end if;
      end loop;
   end Check;

begin
   Market_area.init;
   for i in 1..5 loop
      customerList(i) := new customer(new String'("customer"&Integer'Image(i)),True);
   end loop;
   cnt:=5;
   timer:=0.0;
   while (timer < 60.0) loop
      Check(customerList,cnt);
      timer:= timer+1.0;
      delay 1.0;
   end loop;
   Market_area.Close;
   monitor.printing(Integer'Image(Market_area.getNum)&" customers got infected out of "&Integer'Image(cnt) &" visited the market.");
   monitor.printing(Integer'Image(Market_area.percent)&" percent of area is infected.");




end Main;
