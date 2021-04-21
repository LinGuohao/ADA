with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure thirteen is
   count : Integer :=0;
   N : Integer;
   type number is array (Integer range<>) of Integer;
   final : Integer;
begin
   Get(N);
   final :=N;
   while N mod 10 /= 0 loop
      N := N/10;
      count := count +1 ;
   end loop;
   declare
      numberArray : number (0..count -1);
      isPalindrome : Boolean := True;
      arraysize : Integer ;
   begin
      count :=0;
      while final mod 10 /=0 loop
         numberArray(count) := final mod 10;
         final := final/10;
         count := count + 1;
      end loop;
      arraysize:= count / 2;
      for i in 0..(arraysize -1) loop
         if(numberArray(i) /= numberArray(count-1)) then
            isPalindrome:= False;
         end if;
         count := count -1;

      end loop;

      if isPalindrome then
         Ada.Text_IO.Put("True");
      else
         Ada.Text_IO.Put("False");
      end if;
   end;


end thirteen;
