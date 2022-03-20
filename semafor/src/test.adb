with ADA.Text_IO;use ADA.Text_IO;
procedure test is
   task task1 is
      entry call;
   end task1;

   task task2;

   task body task1 is
   begin
      delay 10.0;
      accept call  do
         Put_Line("In call");
      end call;
   end task1;

   task body task2 is
   begin
      delay 1.0;
      task1.call;
   end task2;





begin
   null;

end test;
