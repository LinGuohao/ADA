with More_Then, Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
procedure Main is
   type mat is array (Integer range <>,Integer range <>) of Natural;
   function more is new More_Then(Integer,mat);
   m: mat :=((1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),
             (1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1));
begin

   Put_Line(Boolean'Image(more(m,11)));
   Put(Boolean'Image(more(m,100)));
end Main;
