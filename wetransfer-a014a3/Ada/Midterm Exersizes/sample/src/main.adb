with mos_f,most_frequent,has_repetition,Ada.Text_IO;
use Ada.Text_IO;
procedure Main is




   --type vec is array (Integer range <>) of String;
   function Has_Double_Letters is new has_repetition(Positive,Character,String);

   function mf is new most_frequent(Positive,Character,String);

   function mf2 is new mos_f(Positive,Character,String);

   str1:String:="hello";
   str2:String:="aabc";
   str3:String:="abcc";
   str4:String:="a";
   str5:String:="Hello,I am going home";
begin
   Put(Boolean'Image(Has_Double_Letters(str1)));
   New_Line;
   Put(Boolean'Image(Has_Double_Letters(str2)));
   New_Line;
   Put(Boolean'Image(Has_Double_Letters(str3)));
   New_Line;
   Put(Boolean'Image(Has_Double_Letters(str4)));
   New_Line;
   Put(Character'Image(mf(str5)));
   New_Line;
    Put(Character'Image(mf(str2)));
   New_Line;
   Put(Character'Image(mf2(str5)));
   New_Line;
end Main;
