with Count_Value, Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Main is

   function bigger(n:Natural) return Boolean is
   begin
      return n>3;
   end bigger;



   type mat is array(Integer range <>,Integer range <>) of Natural;

   function my_cnt is new Count_Value(Integer,Natural,mat,bigger);

   m: mat :=((1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,6,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),
             (1,1,1,1,1,1,1,1,1,1),(1,1,1,1,4,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,9,1,1,1),(1,1,1,1,1,1,1,1,1,1));


begin

   Put(my_cnt(m));
end Main;
