with Most_Frequent,Ada.Text_IO; use Ada.Text_IO;
procedure Most_Frequent_test is
   V1:String := "Hello,I am going home";
   V2:String := "a";
   V3:String := "aaabbbbbdcbebbdfg";
   function Multiplicity is new Most_Frequent(Positive,Character,String);

begin
   Put(Multiplicity(V1));

end Most_Frequent_test;
