with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
procedure first is
   type newarray is array (Integer range <>) of Integer;
   cont : Integer := 0;
   type answer is new Integer;
   type length is new Integer;

   function Tran(N: newarray) return length is
   begin
      return N'Length;
   end Tran;

   function Give_answer(N : newarray) return answer is
      tmp : answer:= N'Length;


   begin
      if N'Length = 1 then
         return answer(N'First);

      else
         --Ada.Integer_Text_IO.Put(Standard.Integer(N'Length));
         return answer(N(N'first)) + Give_answer(N((Standard.Integer'Succ(N'first))..N'Last));
      end if;





   end Give_answer;


   function Sum(N: newarray) return answer is


   begin

      declare
         numberarray: newarray(1..Standard.Integer(Tran(N)));

      begin
         cont :=1;

      for i in N'Range loop
         numberarray(cont) := N(i);
         cont := cont + 1;
      end loop;
         return Give_answer(numberarray);
      end;

   end Sum;

begin
   Put_Line(answer'Image( Sum((1,2,3,4,5))));
end first;
