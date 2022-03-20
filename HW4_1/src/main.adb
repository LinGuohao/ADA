with Ada.Text_IO,ada.numerics.discrete_random;use ADA.Text_IO;
procedure Main is
   protected monitor is
      procedure Printing(S:in String);
   end monitor;
   type BooleanMatrix is array (1..10,1..10) of Boolean;

   protected market is
      procedure init;
      entry Getin(is_infected: in out Boolean;x :in Integer;y:in Integer;name:in String);
      function Get_Percentage return Integer;
      function Get_num_of_infected return Integer;
      procedure ChangeOpen;
   private
      num_of_infected:Integer:=5;
      marketAreay:BooleanMatrix;
      is_open :Boolean := False;
   end market;
   type StringPointer is access String;
   task type customer(name:StringPointer;is_infected:Boolean);
   type customerPointer is access customer;
   type customerArray is array (1..5) of customerPointer;
   protected Tools is
      procedure newCoordinate(x :in out Integer;y:in out Integer);
      procedure changeCoordinate(x:in out Integer;y:in out Integer);
      procedure Check_Customer(customerList: in out customerArray);
      function Get_total_people return Integer;
   private
      total_people :Integer:=5;
   end Tools;



   --------------------------------body-----------------------------------
   protected body monitor is
      procedure Printing(S:in String) is
      begin
         Put_Line(S);
      end Printing;
   end monitor;

   protected body market is
      procedure init is
      begin
         for i in marketAreay'Range(1) loop
            for j in marketAreay'Range(2) loop
               marketAreay(i,j) := False;
            end loop;
         end loop;
         is_open:=False;

      end init;

      entry Getin(is_infected: in out Boolean;x :in Integer;y:in Integer;name:in String) when is_open=True is
      begin
         if(is_infected = True) then
            marketAreay(x,y) := True;
         end if;

         if(is_infected = False and marketAreay(x,y)= True) then

               is_infected:=True;
               num_of_infected:= num_of_infected + 1;
               monitor.Printing(name&" is infected!");

         end if;
      end Getin;

      function Get_Percentage return Integer is
         cunt:Integer;
      begin
         cunt:=0;
         for i in marketAreay'Range(1) loop
            for j in marketAreay'Range(2) loop
               if(marketAreay(i,j)= True) then
                  cunt := cunt + 1;
               end if;
            end loop;
         end loop;

         return cunt;
      end Get_Percentage;

      function Get_num_of_infected return Integer is
      begin
         return num_of_infected;
      end Get_num_of_infected;

      procedure ChangeOpen is
      begin
         if(is_open=False) then
            is_open := True;
            monitor.Printing("The market is open");
         else
            is_open := False;
            monitor.Printing("The market is close");
         end if;
      end ChangeOpen;


   end market;


   protected body Tools is
      procedure newCoordinate(x :in out Integer;y:in out Integer) is
         type randRange is range 1..10;
         package Rand_Int is new ada.numerics.discrete_random(randRange);
         use Rand_Int;
         gen : Rand_Int.Generator;
      begin
         reset(gen);
         x := Integer(random(gen));
         reset(gen);
         y := Integer(random(gen));
      end newCoordinate;

      procedure changeCoordinate(x:in out Integer;y:in out Integer) is
         type randRange is range 1..4;
         package Rand_Int is new ada.numerics.discrete_random(randRange);
         use Rand_Int;
         gen : Rand_Int.Generator;
         num : Integer;
         is_found: Boolean;
         begin
         is_found := False;
         while is_found = False loop
            reset(gen);
            num := Integer(random(gen));
            if(num=1) then
               if(y+1>= 1 and y+1<=10 and x >= 1 and x<= 10) then
                  y := y+1;
                  is_found := True;
               end if;
            elsif(num=2) then
               if(y-1>=1 and y-1<=10 and x>=1 and x<=10) then
                  y:= y-1;
                  is_found := True;
               end if;
            elsif(num =3) then
               if(y>=1 and y<= 10 and x-1>=1 and x-1<=10 ) then
                  x := x-1;
                  is_found := True;
               end if;
            else
               if(y>=1 and y<=10 and x+1 >=1 and x+1<=10) then
                  x:= x+1;
                  is_found := True;
               end if;
            end if;
         end loop;

      end changeCoordinate;

      procedure Check_Customer(customerList: in out customerArray) is
      begin
         for i in customerList'Range loop
            if(not customerList(i).all'Callable) then
               customerList(i) := new customer(new String'(Integer'Image(total_people)&("th customer")),False);
               total_people:=total_people+1;
            end if;
         end loop;
      end Check_Customer;

      function Get_total_people return Integer is
      begin
         return total_people;
      end Get_total_people;

   end Tools;




   task body customer is
      start : Duration;
      endtime:Duration;
      shouldEnd: Boolean;
      infected:Boolean;
      x:Integer;
      y:Integer;
   begin
      infected:=is_infected;
      shouldEnd := False;
      start:=0.0;
      endtime := 2.0;
      x:=0;
      y:=0;
      Tools.newCoordinate(x,y);
      monitor.Printing(name.all & " ready to enter the market");
      while shouldEnd = False loop
         select
            market.Getin(infected,x,y,name.all);
         else
            null;
         end select;
         delay 0.5;
         start := start + 0.5;
         Tools.changeCoordinate(x,y);
         if(start>= endtime) then
            shouldEnd := True;
         end if;
      end loop;

   end customer;


   startTime:Duration;
   endTime:Duration;
   customerList : customerArray;
   shouldClose:Boolean;
begin
   market.init;
   market.ChangeOpen;
   for i in 1..5 loop
      customerList(i):= new customer(new String'(Integer'Image(i)&("th customer")),True);
   end loop;
   shouldClose := False;
   startTime:=0.0;
   endTime:=60.0;
   while shouldClose = False loop
      delay 1.0;
      Tools.Check_Customer(customerList);
      startTime:= startTime + 1.0;
      if(startTime>= endTime) then
         shouldClose := True;
         market.ChangeOpen;
      end if;
   end loop;
   monitor.Printing(Integer'Image(market.Get_Percentage)&" percent of area is infected");
   monitor.Printing(Integer'Image(market.Get_num_of_infected)&" customers got infected out of"&Integer'Image(Tools.Get_total_people)&" visited the market");


end Main;
