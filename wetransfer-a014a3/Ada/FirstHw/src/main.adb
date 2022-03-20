with String_Types, Ada.Text_IO,Ada.Integer_Text_IO;
use String_Types, Ada.Text_IO,Ada.Integer_Text_IO;
procedure Main is
   a:String:="haha";
   b:String_Type:=Init(a);
   c:String_Type:=Init(a);
   d:String_Type:=Init("hahahaha6haha");
   e:String_Type:=Init("hahahahahaha2");
   f:String_Type:=Init("somethingelse");
   g:String_Type:=Init("abcdhahaefg");
   --arr:String_Type_Array:=Split(f,'e');
   l:String:="a";
begin
   --a:=Init(b);
   --Print(b);
   Put_Line(toString(b));
   Put_Line(Char_At(b,3)'Image);
   Put_Line(Compare_To(b,c)'Image);
   --Print(b+c);
   Put_Line(toString(b+c));
   Put(Index_Of(b,'a'));
   Put_Line("");
   Put(Index_Of(b,'a',3));
   Put_Line("");
   Put(Last_Index_Of(b,'h'));
   Put_Line("");
   Put(Length(b));
   Put_Line("");
   Replace(c,'h','j');
   --Print(c);
   Put_Line(toString(c));
   --l:=l & 'a';
   --Put_Line(l & 'a');
   --Print(b);
   Put_Line(toString(b));
   --Print(d);
   Put_Line(toString(d));
   Put_Line(Ends_With(d,b)'Image);
   Put_Line(Ends_With(e,b)'Image);
   Put_Line(Ends_With(d,"ha")'Image);
   Put_Line(Ends_With(e,"ha")'Image);
   Put_Line(Starts_With(d,b)'Image);
   Put_Line(Starts_With(f,b)'Image);
   Put_Line(Starts_With(d,"hah")'Image);
   Put_Line(Starts_With(f,"hah")'Image);

   Put_Line(Contains(f,b)'Image);
   Put_Line(Contains(g,b)'Image);
   Put_Line(Contains(f,Init("thing"))'Image);
   Put_Line(Contains(f,Init("ethi"))'Image);
   Put_Line("here");
   --Print(Substring(g,3));
   Put_Line(toString(Substring(g,3)));
   --Print(Substring(f,5,9));
   Put_Line(toString(Substring(f,5,9)));
   Put(Index_Of(f,"thing"));
   Put_Line("");
   Put(Last_Index_Of(d,"haha"));
   Put_Line("");
   --Split(f,'e');

   declare
      arr:String_Type_Array:=Split(f,'e');
   begin
      null;
      for I in arr'Range loop
         if (toString(arr(I))/="") then
            Put_Line( toString(arr(I)) );
         end if;

      end loop;

   end;

   Put_Line("It works!");


end Main;
