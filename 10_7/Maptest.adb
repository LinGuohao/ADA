with map, Ada.Text_IO;
use Ada.Text_IO;
procedure Maptest is
type t1 is array (Integer range <>) of Integer;
type t2 is array (Integer range <>) of Float;

   function square (x: Integer) return Float is
   begin
      return Float(x*x);

   end square;

   function half(x: Integer) return Float is
   begin
      return Float(x)/2.0;
   end half;

   function my_map is new map(Integer, Float, t1, t2, square);
   function my_map_test is new map(Integer, Float, t1, t2, half);

a: t1(1..5):=(1, 2, 3, 4, 5);
b: t2(a'range);

begin
b:=my_map_test(a);
for i in b'Range loop
Put_Line(Float'Image(b(i)));
end loop;
end Maptest;
