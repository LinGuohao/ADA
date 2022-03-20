with ada.numerics.discrete_random,Ada.Text_IO;use Ada.Text_IO;
procedure Main is
   type String_Pointer is access String;
   type area is array (Integer range<>,Integer range<>) of Boolean;

   protected Print is
      procedure PrintString(S:in String) ;
   end Print;

   protected body Print is
      procedure PrintString(S:in String) is
         begin
         Put_Line(S);
      end PrintString;
   end Print;


   protected Market is
      entry move(x:in Integer;y:in Integer;is_infected:in out Boolean;name: in String_Pointer);
      function GetNum return Integer;
      procedure SetOpen;
      function GetOpen return Boolean;
      function Infected_cells_percentage return Integer;
      procedure init;
   private
      Market_area : area(1..10,1..10);
      Num:Integer :=5;
      Open: Boolean:=True;
   end Market;

   protected body Market is
      entry move(x:in Integer;y:in Integer;is_infected:in out Boolean;name:in String_Pointer ) when True is
      begin
         if(is_infected = True) then
            Market_area(x,y) := True;
         end if;

         if(Market_area(x,y)= True) then
            if(is_infected = False) then
               Num:=Num+1;
               is_infected:=True;
               Print.PrintString(name.all &" was infected");
            end if;

         end if;
      end move;
      function GetNum return Integer is
      begin
         return Num;

      end GetNum;

      procedure SetOpen is
      begin
         if(Open = True) then
            Open := False;

         else
            Open := True;

         end if;
      end SetOpen;

      function GetOpen return Boolean is
      begin
         return Open;
      end GetOpen;

      function Infected_cells_percentage return Integer is
         number_of_cell:Integer;
         infected_cell:Integer;
         ans : Float;
      begin
         number_of_cell := 0;
         infected_cell := 0;
         for i in Market_area'Range(1) loop
            for j in Market_area'Range(2) loop
               number_of_cell := number_of_cell + 1;
               if(Market_area(i,j) = True ) then
                  infected_cell := infected_cell + 1;
               end if;
            end loop;
         end loop;
         ans := (Float(infected_cell)/Float(number_of_cell)) * Float(100);
         return Integer(ans);
      end Infected_cells_percentage;
      procedure init is
      begin
         for i in Market_area'Range(1) loop
            for j in Market_area'Range(2) loop
               Market_area(i,j):=False;
            end loop;
         end loop;
      end init;

   end Market;


   type range10 is range 1..10;
   type range4 is range 1..4;
   package Rand10 is new ada.numerics.discrete_random(range10);
   package Rand4 is new ada.numerics.Discrete_Random(range4);
   use Rand10;use Rand4;
   protected Generator is
      function Generator10 return Integer;
      function Generator4 return Integer;
   private
      gen10: Rand10.Generator;
      gen4: Rand4.Generator;

   end Generator;

   protected body Generator is
      function Generator10 return Integer is
         num:Integer;
      begin
         Rand10.reset(gen10);
         num := Integer(Rand10.random(gen10));
         return num;
      end Generator10;

      function Generator4 return Integer is
         num : Integer;
      begin
         Rand4.Reset(gen4);
         num:= Integer(Rand4.Random(gen4));
         return num;
      end Generator4;
   end Generator;

   procedure Modify(X:in out Integer;Y:in out Integer) is
      tmpX:Integer;
      tmpY : Integer;
      find : Boolean;
   begin
      find := False;
      -- 1 => Go up || 2 => Go down || 3 => Go left|| 4 => Go right
      loop
         if(Generator.Generator4 = 1) then
         tmpY:= -1;
         elsif(Generator.Generator4 = 2) then
            tmpY:= 1;
         elsif(Generator.Generator4 = 3) then
            tmpX := -1;
         else
            tmpX:= 1;
         end if;
         if(X+tmpX <=10 and X+tmpX >= 0 and Y+tmpY <= 10 and Y+ tmpY >=0) then
            X:=X+tmpX;
            Y:= Y + tmpY;
            find:=True;
         else
            find:=False;
         end if;
         exit when find = True;
         end loop;

   end Modify;


   task type Customer(name: String_Pointer;tmp :Boolean);

   task body Customer is
      timer: Float;
      finished : Boolean;
      is_infected:Boolean;
      X: Integer;
      Y:Integer;

   begin
      --Put_Line(Float'Image(timer));
      is_infected:=tmp;
      X:= Generator.Generator10;
      Y:= Generator.Generator10;
      Market.move(X,Y,is_infected,name);
      finished := False;
      timer:= 0.0;

      while finished /= True loop
         Modify(X,Y);
         if(Market.GetOpen = True) then
            Market.move(X,Y,is_infected,name);
         end if ;
         delay 0.5 ;
         timer := timer + 0.5;
         --Put_Line(Float'Image(timer));
         if(timer = 2.0) then
            finished := True;
            --Put_Line("1");
            exit;
         end if;
      end loop;
   end Customer;

   type Customer_Pointer is access Customer;
   sum: Integer;
   type Customer_Array is array(Integer range<>) of Customer_Pointer;
   Customers : Customer_Array(1..5);
   --name1 : String_Pointer ;
   finished : Boolean;
   timer : Float;
   --test:Boolean;
   --newName : String_Pointer;
begin

   timer := 0.0;
   finished:=False;
   --name1 := new String'("Tom");
   Market.init;
   Customers(1) := new Customer(new String'("Customer1"),True);
   Customers(2) := new Customer(new String'("Customer2"),True);
   Customers(3) := new Customer(new String'("Customer3"),True);
   Customers(4) := new Customer(new String'("Customer4"),True);
   Customers(5) := new Customer(new String'("Customer5"),True);
   sum:=5;
    --Put_Line(Integer'Image(sum));
   while finished /= True loop
      for i in Customers'Range loop
         --Put_Line(Integer'Image(i));
         if(Customers(i)'Terminated) then
            sum := sum + 1;

            Customers(i) := new Customer(new String'("Customer"&Integer'Image(sum)),False);
         end if;
      end loop;
      delay 1.0;
      timer := timer + 1.0;
      if(timer = 60.0) then
         finished := True;
         Market.SetOpen;
         Print.PrintString("Market was closed!");
      end if;
     -- Put_Line("1");
   end loop;

       --Put_Line(Boolean'Image(test));
      Print.PrintString(Integer'Image(Market.GetNum) &" customers got infected out of "&Integer'Image(sum) &" visited the market");
      Print.PrintString(Integer'Image(Market.Infected_cells_percentage)&" percent of area is infected");
end Main;

