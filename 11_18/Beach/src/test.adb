with Ada.Text_IO; use Ada.Text_IO;
procedure test is

   task T is
      entry sand;
      entry Left;

   end T;

   task body T is
   begin

      Put("1");
      accept sand;
      Put("2");
      accept Left;
      Put("3");
   end T;


begin
   T.sand;
   T.Left;

end test;
