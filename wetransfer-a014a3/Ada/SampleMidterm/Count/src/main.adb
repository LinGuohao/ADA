with Count, Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure Main is
   type mat is array (Integer range <>,Integer range <>) of Natural;
   function my_count is new Count(Integer,mat);
   m: mat:=((1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),
             (1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1));

begin

  Put(my_count(m));
end Main;
