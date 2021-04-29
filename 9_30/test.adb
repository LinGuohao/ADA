with Ada.Text_IO;use Ada.Text_IO;
procedure test is

type Elem is new Integer;
type My_Array is array (Integer range <>) of Elem;

arr : My_Array := (1,2,3,4,5);

begin
for i in reverse 1..5 loop
Put(Elem'image(arr(i)));
end loop;
end test;
