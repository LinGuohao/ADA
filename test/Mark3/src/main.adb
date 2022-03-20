with Ada.Text_IO,Bags;use Ada.Text_IO;
procedure Main is
   package MyBag is new Bags(Character);
   use MyBag;
   S : String :="which mark will I get for the test?";
   A:Bag;
begin
   for i in S'Range loop
      Add(A,S(i));
   end loop;

   Put_Line(Natural'Image(Multiplicity(A,'e')));
end Main;
