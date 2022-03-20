with Has_Repertition2,Ada.Text_IO; use Ada.Text_IO;
procedure Has_Repertition2_test is
   V1:String := "aaaaaab";
   V2:String := "a";
   V3:String := "ab";
   function test is new Has_Repertition2(Positive,Character,String);
begin
   Put(Integer'Image(test(V1)));
end Has_Repertition2_test;
