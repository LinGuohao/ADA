with Ada.Integer_Text_IO;
package body starting is

   procedure Combination is
      n,k:Natural;
      s:Natural;
   begin
      Ada.Integer_Text_IO.Get(n);
      Ada.Integer_Text_IO.Get(k);
      s:= factorial(n)/(factorial(k) * factorial(n-k));
      Ada.Integer_Text_IO.Put(s);
   end Combination;

   function factorial(N:Natural) return Positive is
   S:Positive:=1;
   begin
      for I in 1..N loop
         S:=S*I;
      end loop;
      return S;
   end factorial;


   function gcd(A,B  : in out Integer) return Integer is
   begin
      while A/=B loop
         if A>B then
            A:=A-B;
         else
            B:=B-A;
         end if;


      end loop;
      return A;
   end gcd;


end starting;
