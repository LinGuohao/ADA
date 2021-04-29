with Reversal , Ada.Text_IO;
use Ada.Text_IO;
procedure testReversal is
   type t1 is array (Integer range <>) of Integer;
   type t2 is array (Integer range <>) of Integer;


   function test_Reversal is new Reversal(Integer,t1, t2);
   a: t1(1..5):=(1, 2, 3, 4, 5);
   b: t2(a'range);

begin
   b := test_Reversal(a);
   for i in b'Range loop
      Put(Integer'Image(b(i)));
   end loop;


end testReversal;
