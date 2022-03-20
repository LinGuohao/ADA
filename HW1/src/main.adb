with Vector_package,Ada.Text_IO;use Vector_package;
procedure Main is
   V1:Vector;
   V2:Vector;
   arr : TArray(1..100);
   arr2: TArray(1..99);
begin
   insert(V1,3);
   --print_Vector(V1);
   assign(V2,5,6);
   --print_Vector(V2);
   pop(V2);
   --print_Vector(V2);
   swap(V1,V2);
   --print_Vector(V1);
   --print_Vector(V2);
   assign(V1,100,100);
   --print_Vector(V1);
   assign(V1,96,100);
   --print_Vector(V1);
   insert(V1,6);
   --print_Vector(V1);
   --print_Vector(V2);
   remove(V2,3);
   --Ada.Text_IO.Put_Line(Integer'Image(size(V2)));
   --print_Vector(V2);
   --print_Vector(V1);
   remove(V1,100,true);
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   --print_Vector(V1);
   --Ada.Text_IO.Put_Line(Boolean'Image(is_Empty(V1)) & Boolean'Image(is_Empty(V2)));
   join(V1,V2);
   --print_Vector(V1);
   assign(V2,96,100);
   join(V1,V2);
   --print_Vector(V1);
   insert(V1,10);
   remove(V1,100);
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   clear(V1);
   clear(V2);
   --Ada.Text_IO.Put_Line(Integer'Image(last(V2)));
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   --Ada.Text_IO.Put_Line(Integer'Image(size(V2)));
   --print_Vector(V2);
   --Ada.Text_IO.Put_Line(Integer'Image(first(V1)));
   insert(V1,9);
   --Ada.Text_IO.Put_Line(Integer'Image(first(V1)));
   for i in 1..99 loop
      arr(i) := 100;
      arr2(i):= 100;
   end loop;
   --Ada.Text_IO.Put_Line(Integer'Image(arr(arr'Last)));
   copy(V1,arr);
   copy(V1,arr2);
   --print_Vector(V1);
   --Ada.Text_IO.Put_Line(Integer'Image(last(V1)));
   clear(V1);
   clear(V2);
   assign(V1,5,5);
   assign(V2,5,6);
   swap(V1,V2);
   --print_Vector(V1);
   --print_Vector(V2);
   pop(V1);
   swap(V1,V2);
   --print_Vector(V1);
   --print_Vector(V2);
   clear(V2);
   swap(V1,V2);
   --print_Vector(V1);
   --print_Vector(V2);
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   --Ada.Text_IO.Put_Line(Integer'Image(size(V2)));
   --Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   assign(V1,5,5);
   --Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   clear(V1);
   clear(V2);
   --Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   insert(V1,5);
   --Ada.Text_IO.Put_Line(Integer'Image(size(V1)));
   assign(V1,99,100);
   --print_Vector(V1);
   insert(V1,1);
   clear(V1);
   clear(V2);
   Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   insert(V1,2);
   insert(V1,1);
   Ada.Text_IO.Put_Line(Integer'Image(last(V1)));
   insert(V2,1);
   insert(V2,2);
   Ada.Text_IO.Put_Line(Integer'Image(last(V2)));
   Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   insert(V2,3);
   Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   insert(V1,3);
   Ada.Text_IO.Put_Line(Boolean'Image(compare(V1,V2)));
   Ada.Text_IO.Put_Line(Integer'Image(last(V1)));








end Main;
