with Has_Repetition,Ada.Text_IO; use Ada.Text_IO;
procedure Has_Repetition_test is
   V1:String := "aa";
   V2:String := "a";
   V3:String := "ab";
   function Has_Double_Letters is new Has_Repetition(Positive,Character,String);
begin
   Put(Boolean'Image(Has_Double_Letters(V3)));
end Has_Repetition_test;
