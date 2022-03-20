with Ada.Integer_Text_IO,Ada.Text_IO,Ada.Float_Text_IO;
use Ada.Integer_Text_IO,Ada.Text_IO,Ada.Float_Text_IO;
procedure Main is
   a:Float:=1.2;
   b:Float :=1.6;
   c:Float :=-1.6;

   function factorial(n:Natural) return Natural is
      fact:Positive:=1;
      z:Natural:=n;
   begin
      while(z>0) loop
         fact:=fact*z;
         z:=z-1;
      end loop;

      return fact;
   end;


   function comb(n,k:natural) return Natural is
   begin

      return factorial(n) /(factorial(k) * factorial(n-k));
   end comb;

   procedure pi(a:FLoat) is
      -- a:FLoat:=1.0;
      prod:Float:=1.0;
      x:Float:=0.0;
   begin

      for I in 1..20000 loop
         x:=x+2.0;
         prod:=prod * (x/(x-1.0)) * (x/(x+1.0));
      end loop;

      Ada.Float_Text_IO.Put(2.0*prod);
   end pi;

   procedure Pi2 (x:Float) is
      Prod : Float := 1.0;
      k : Float := 0.0;
   begin
      for I in 1..20000 loop
         k := k + 2.0;
         Prod := Prod * (k / (k-1.0)) * (k / (k+1.0));
      end loop;
      Ada.Float_Text_IO.Put( 2.0 * Prod );
   end Pi2;

   function isEven (x:Natural) return Boolean is
   begin
      if x rem 2 = 0 then
         return True;
      else
         return False;
      end if;
   end isEven;

   procedure Euler is
      denom :Float:=2.0;
      rez:Float:=1.0;
   begin
      for I in 1..200000 loop
         rez:=rez+(rez*(1.0/denom));
         denom:=denom+1.0;
      end loop;

      Ada.Float_Text_IO.Put( rez );

   end Euler;


   function addDigits(n:Natural) return Natural is
      num:Natural:=n;
      rez:Natural:=0;
   begin
      while num/=0 loop
         rez:=rez + num rem 10;
         num:=num/10;
      end loop;
      return rez;
   end addDigits;

   function dgits(n:Natural) return Natural is
      num:Natural:=n;
      rez:Natural:=0;
   begin

      while num/=0 loop
         rez:=rez +1;
         num:=num/10;
      end loop;
      return rez;
   end dgits;

   function divisble(n:Natural) return Boolean is
   begin
      return n rem 9 =0;
   end divisble;


   procedure perfect is
      sum:Natural;
   begin
      for i in 1..10000 loop
         sum:=0;
         for j in 1..i-1 loop
            --Put(j);
            if i rem j = 0 then
               --Put("yes");
               sum:=sum+j;
            end if;
         end loop;


         if i=sum then
            Put(i);
            New_Line;
         end if;
      end loop;


   end perfect;




   type Tarry is array(Integer range <>) of Integer;

   procedure Print(t:Tarry) is
   begin
      Put_Line("array");
      for i in t'First..t'Last loop
         Put(t(i));
         New_Line;
      end loop;
   end Print;



   function isPali(n:Natural) return Boolean is
      num:Natural:=n;
      arr:Tarry(1..dgits(n));
      i:Integer:=1;
   begin
      Put(dgits(n));

      while num/=0 loop
         arr(i):= num rem 10;
         Put(arr(i));
         num:=num/10;
         i:=i+1;
      end loop;
      i:=1;

      Print(arr);
         for j in reverse arr'First..arr'Last loop
         if(arr(i)/=arr(j)) then
            Put(arr(i));
            Put(arr(j));
               return False;
            end if;
            i:=i+1;
         end loop;

         return True;
   end isPali;


   function power(x,n:Natural) return Natural is
   begin
      if n=0 then
         return 1;
      else
         return x * power(x,n-1);
      end if;

   end power;

   function fact(n:Natural) return Natural is
   begin
      if n=0 then
         return 1;
      else
         return n * fact(n-1);
      end if;

   end fact;

   function suma(t:Tarry;i:Integer) return Integer is
   begin
      if i>t'Last then
         return 0;
      else
         return t(i) + suma(t,i+1);
      end if;

   end suma;

   procedure swap(a,b : in out Integer) is
      tmp:Integer;
   begin
      tmp:=a;
      a:=b;
      b:=tmp;
   end swap;



   procedure bubblesort(t:in out Tarry) is
   begin
      for i in t'Range loop
         for j in t'First..Integer'Pred(t'Last) loop
            if t(j) > t(Integer'Succ(j)) then
               swap(t(j),t(Integer'Succ(j)));
            end if;


         end loop;

      end loop;

   end bubblesort;

   type mat is array (Integer range<> ,Integer range <>) of Integer;

   function mainD(t:mat) return Integer is
      rez:Integer:=0;
   begin
      for i in t'Range(1) loop
         for j in t'Range(2) loop
            if i-t'First(1) = j-t'First(2) then
               rez:=rez+t(i,j);
            end if;

         end loop;
      end loop;

         return rez;
   end mainD;



   function maxRow(m:mat;i:Integer) return Integer is
      pos:Integer:=m'First(2);
   begin
      for j in Integer'Succ(m'First(2))..m'Last(2) loop
         if m(i,pos)<m(i,j) then
            pos:=j;
         end if;

      end loop;

      return pos;

   end maxRow;

   function minCol(m:mat;i:Integer) return Integer is
      pos:Integer:=m'First(1);
   begin
      for j in Integer'Succ(m'First(1))..m'Last(1) loop
         if m(pos,i)>m(j,i) then
            pos:=j;
         end if;

      end loop;

      return pos;

   end minCol;



   procedure local(m:mat) is
   begin
      Put_Line("locals:");
      for i in m'Range(1) loop
         for j in m'Range(2) loop
            if m(minCol(m,j),j) = m(i,maxRow(m,i)) then
               Put(m(i,j));
               Put(i);
               Put(j);
               New_Line;
            end if;

         end loop;
      end loop;

   end local;


   ae:Tarry(1..4):=(4,3,2,1);
   mat1:mat(1..4,4..7):=((1,2,3,4),(1,2,3,4),(1,2,3,4),(1,2,3,4));
   mat2:mat(1..3,1..5):=((11,22,33, 44, 55),(1,8,3,8,8),(10,10,20,30,1));
begin
   Put(Integer(a));
   New_Line;
   Put(Integer(b));
   New_Line;
   Put(Integer(c));
   New_Line;
   Put(factorial(5));
   New_Line;
   Put(comb(5,3));
   New_Line;
   pi(1.0);
   New_Line;
   Pi2(1.0);
   New_Line;
   Put(Boolean'Image(isEven(3)));
   New_Line;
   Euler;
   New_Line;
   Ada.Integer_Text_IO.Put(3,1);
   New_Line;
   Put(addDigits(123));
   New_Line;
   Put_Line(Boolean'Image(divisble(123)));
   Put_Line(Boolean'Image(divisble(addDigits(1233))));
      perfect;
   Put_Line(Boolean'Image(isPali(1331)));
   Put(power(2,5));
   New_Line;
   Put(fact(5));
   New_Line;
   Put(suma(ae,1));
   New_Line;
   Print(ae);
   New_Line;
   bubblesort(ae);
   Print(ae);
   Put(mainD(mat1));
   New_Line;
   local(mat2);
   New_Line;

end Main;
