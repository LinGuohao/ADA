with Reversal2, Ada.Text_IO;
use Ada.Text_IO;
procedure testReversal2 is
   type t1 is array (Integer range <>) of Integer;

   procedure SwapInt(x:in out Integer; y: in out Integer) is
      tmp: Integer;
   begin
      tmp:= x;
      x:= y;
      y:= tmp;


   end SwapInt;





   procedure test_Reversal2 is new Reversal2(Integer,t1, SwapInt);
   a: t1(1..5):=(1, 2, 3, 4, 5);

begin
   test_Reversal2(a);
   for i in a'Range loop
      Put(Integer'Image(a(i)));
   end loop;


end testReversal2;
