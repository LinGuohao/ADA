with Ada.Text_IO;use Ada.Text_IO;
procedure test2 is
   task task1 is
      entry entry1;
      entry entry2;
   end task1;

   task body task1 is
   begin
      Put_Line("Before select");
      select
         accept entry1  do
            Put_Line("Here");
         end entry1;
      or
         accept entry2  do
            Put_Line("Here2");
         end entry2;
      end select;
      Put_Line("Here3");
   end task1;

begin
   null;

end test2;
