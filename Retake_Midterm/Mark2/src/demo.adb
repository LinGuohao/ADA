with ada.Text_IO,For_All;use Ada.Text_IO;
procedure demo is
   s:String:="Hello World!";
   procedure Decode(S: in out String) is
   begin
      for i in S'Range loop
         S(i):=Character'Succ(S(i));
      end loop;
   end Decode;


   procedure DecodeMethod is new For_all(Character,Positive,String,Decode);


begin
   DecodeMethod(s);
   Put_Line(s);
end demo;
