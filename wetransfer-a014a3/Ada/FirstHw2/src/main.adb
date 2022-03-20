with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;
with String_Types;
procedure Main is

   --REMARK:
   --I was not sure how much we could change the whole thing from our first version without generics
   --so instead of adding a min as dicriminant I just fixed the positions starting from Index'First
   -- And i instatiate it in that way that max represent how much we add to Index'First
   -- in order to make the printing nicer i added the getDesrideInd function and the postion function in th main
   -- only so when printed we wont get confused by extrememly small numbers

   --I hope that's okay


   package IString is new String_Types(Character,Integer);
   use IString;

   type MyEnum is (equal,bigger,smaller);
   procedure mycompare is new Compare_To(MyEnum);
   package MyEnum_IO is new Enumeration_IO(MyEnum);
   --type TArray is array ( Integer range <> ) of Character;

   function getDesrideInd(n:Integer) return Integer is
      ind:Integer:=Integer'First;
   begin
      for I in 1..n loop
         ind:=Integer'Succ(ind);
      end loop;
      return ind;
   end getDesrideInd;

   function position(n:Integer) return Integer is
      ind:Integer:=Integer'First;
      pos:Integer:=1;
   begin
      while ind<n loop
         pos:=pos+1;
         ind:=Integer'Succ(ind);
      end loop;
      return pos;

   end position;


   procedure Print(a:TArray) is
   begin
      if (a'Length>1) then
         for I in a'First..Integer'Pred(a'Last) loop
        -- if(a(I)= '0') then
         --   exit;
         --end if;

            Put(a(I));
         end loop;
         Put_Line("");
      else
         --if(a(a'First)) then
            Put(a(a'First));
         --end if;

         Put_Line("");
      end if;

   end Print;

  -- arr:TArray('a'..'d'):=(1,2,3,4);
  -- emptyArr:TArray('b'..'a');
  -- b:Boolean:=(arr'First < arr'Last);
   e:MyEnum;
   str1:TArray(1..5):="hello";
   a:String_Type:=Init(str1);
   b:String_Type:=Init(str1);
   str2:TArray(1..5):="world";
   c:String_Type:=Init(str2);
   str3:TArray(1..10):="helloworld";
   d:String_Type:=Init(str3);
   str4:TArray(1..3):="hey";
   ed:String_Type:=Init(str4);
   str5:TArray(1..13):="somethingelse";
   f:String_Type:=Init(str5);
   str6:TArray:="s";
   g:String_Type:=Init(str6);
   str7:TArray(1..3):="hel";
   ed2:String_Type:=Init(str7);
begin
   Print(toString(a));
   Print(toString(c));
   Put(Char_At(a,Integer'First)'Image);
   Put_Line("");
   mycompare(a,b,e);
   MyEnum_IO.Put(e);
   Put_Line("");
   mycompare(f,b,e);
   MyEnum_IO.Put(e);
   Put_Line("");
   mycompare(ed,b,e);
   MyEnum_IO.Put(e);
   Put_Line("");
   mycompare(ed,ed2,e);
   MyEnum_IO.Put(e);
   Put_Line("");
   Print(toString(a+c));
   Put(Contains(d,c)'Image);
   Put_Line("");
   Put(Contains(d,str2)'Image);
   Put_Line("");
   Put(Contains(d,ed)'Image);
   Put_Line("");
   Put(Ends_With(d,ed)'Image);
   Put_Line("");
   Put(Ends_With(d,c)'Image);
   Put_Line("");
   Put(Ends_With(d,str2)'Image);
   Put_Line("");
   --Put(Index_Of(d,'l'));
   --Put_Line("");
   Put(position(Index_Of(d,'l')));
   Put_Line("");
    Put(position(Index_Of(d,str2)));
   Put_Line("");
   Put(position(Index_Of(d,'o',getDesrideInd(6))));
   --Put_Line("");
   --Put(Last_Index_Of(d,'l'));
   Put_Line("");
   Put(position(Last_Index_Of(d,'l')));
   Put_Line("");
   Put(position(Last_Index_Of(d,str2)));
   Put_Line("");
   Put(Starts_With(d,ed)'Image);
   Put_Line("");
   Put(Starts_With(d,a)'Image);
   Put_Line("");
   Put(Starts_With(d,str1)'Image);
   Put_Line("");
   Put(Length(d));
   Put_Line("");
   Print(toString(Substring(d,getDesrideInd(6))));
   Print(toString(Substring(f,getDesrideInd(5),getDesrideInd(9))));
   Replace(d,'o','t');
   Print(toString(d));
   --Put_Line("");
   Print(toString(g));
   --Put_Line("");
   Put(Length(g));
   Put_Line("");

   declare
      arr:String_Type_Array:=Split(f,'e');
   begin

      --Put(arr'Length);
      for I in arr'Range loop
         if (Length(arr(I))/=0) then
            Print( toString(arr(I)) );
         end if;
null;
      end loop;

   end;


end Main;
