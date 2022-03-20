with ADA.Text_IO; use ADA.Text_IO;
procedure test3 is

task task1 is
   entry call1;
end task1;

task task2 is
   entry call2;
end task2;

task body task1 is
   begin
      delay 4.0;
   accept call1 do
      Put_Line("In task1");
   end call1;
end task1;

task body task2 is
   begin
      delay 2.0;
   accept call2 do
      Put_Line("In task2");
   end call2;
end task2;



begin
   select
      task1.call1;
   or

      task2.call2;
   else
      Put_Line("Here");
   end select;

   task2.call2;

exception
   when Tasking_Error =>
      Put_Line("Here");


end test3;
