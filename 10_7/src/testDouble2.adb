with double2, Ada.Text_IO;
use Ada.Text_IO;
procedure testDouble2 is
   type t1 is array (Integer range <>) of Integer;








procedure test_double2 is new double2(Integer,t1,3,"=");


   a: t1(1..5):=(1, 2, 3, 4, 3);
   index1 : Integer;
   index2:Integer;
   is_true :Boolean;

begin
   test_double2(a,is_true,index1,index2);
   Put_Line(Boolean'Image(is_true));
   Put_Line(Integer'Image(index1) & Integer'Image(index2));

end testDouble2;
