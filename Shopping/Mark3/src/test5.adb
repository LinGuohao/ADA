with ADA.Text_IO;use ADA.Text_IO;
procedure test5 is
   task task1 is
      entry call;
   end task1;

   task task2 ;

   task body task1 is
   begin
      accept call  do
         Put_Line("In task1!");
         delay 5.0;
         Put_Line("task1");
      end call;
      delay 3.0;
      Put_Line("task1 again");
   end task1;

   task body task2 is
   begin
      task1.call;
      Put_Line("task2");
   end task2;


begin
   delay 1.0;

end test5;
