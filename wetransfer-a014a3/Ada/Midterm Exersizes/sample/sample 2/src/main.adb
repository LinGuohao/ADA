with PSet,Ada.Text_IO,Ada.Integer_Text_IO;
use Ada.Text_IO;
procedure Main is
   package myset is new PSet(Character);
   use myset;

   arr:TArray(1..5):="hello";

   s:Set:=Make_Set(arr);
   t:Set:=Make_Set('l');
   v:Set:=Make_Set("worlds");
   union:Set:=s+v;
   inter:Set:=s*v;
   a:TArray:=Decompose(union);
begin
   print_Set(s);
   print_Set(t);
   Put_Line(Boolean'Image(Contains(t,s)));
   New_Line;
   print_Set(union);
   print_Set(inter);
   Put_Line(Boolean'Image('l'<inter));
   Put_Line(Boolean'Image('w'<inter));
   Ada.Integer_Text_IO.Put(Size(v));
   New_Line;

   for i in a'Range loop
      Put(a(i));
   end loop;
   New_Line;

end Main;
