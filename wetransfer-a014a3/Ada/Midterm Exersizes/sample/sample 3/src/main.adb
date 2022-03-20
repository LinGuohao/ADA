with More_then,Count, Ada.Text_IO,Count_Value;
use Ada.Text_IO;
procedure Main is

   function bigger(k:Natural) return Boolean is
   begin
      return k>3;
   end bigger;


   type gr is array (Positive range<>, Positive range <>) of Natural;
   function cnt is new Count(Positive,gr);
   function mt is new More_then(Positive,gr);
   function cv is new Count_Value(Positive,Natural,gr,bigger);

   g:gr(1..10,1..10):=((1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),
                      (1,1,1,1,1,1,1,1,1,1),(1,1,9,1,1,1,1,1,1,1),(1,1,1,1,1,4,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1));
begin

   Put_Line(Natural'Image(cnt(g)));
   Put_Line(Boolean'Image(mt(g,3)));
   Put_Line(Natural'Image(cv(g)));
end Main;
