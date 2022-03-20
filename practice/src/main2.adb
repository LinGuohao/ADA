with Has_Repetition,Most_Frequent,Most_Frequent2,Ada.Text_IO;
use Ada.Text_IO;
procedure main2 is
   S1:String:="aaa";
   S2:String:="abc";
   S3:String:="Hello,I am going home";
   S4:String:="aaaaaaaaaaaaas";
   S5:String:="saaaaaaaaaaaaa";
   function Has_Double_Letters is new Has_Repetition(Positive,Character,String);
   function test2 is new Most_Frequent(Positive,Character,String);
   function test3 is new Most_Frequent2(Positive,Character,String);
begin
   Put_Line(Boolean'Image(Has_Double_Letters(S1)));
   Put_Line(Boolean'Image(Has_Double_Letters(S2)));
   Put_Line(Character'Image(test2(S3)));
   Put_Line(Character'Image(test2(S4)));
   Put_Line(Character'Image(test2(S5)));
   Put_Line(Integer'Image(test3(S3)));
   Put_Line(Integer'Image(test3(S4)));
   Put_Line(Integer'Image(test3(S5)));
end main2;
