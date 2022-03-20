with Ada.Text_IO;use Ada.Text_IO;
procedure test1 is
   task task1 is
      entry call;
      entry change;
   end task1;

   task task2 is
      entry call;
      entry change;
   end task2;



   task body task1 is
   a : Boolean;
   begin
      a := True;

         --while a loop
         select
            accept call  do
               Put_Line("In call");
            end call;
         or
            accept change  do
               a:=False;
            end change;
         end select;



   end task1;


   task body task2 is
      a:Boolean;
   begin
      a:= True;

         select
            accept call  do
               Put_Line("In task2");
            end call;
         or
            accept change  do
               a:=False;
         end change;
      or
         delay
           0.1;
      end select;

      --terminate;


   end task2;




begin
   delay 1.0;
   select
      task2.call;
   or
      delay 1.0;
   end select;

   Put_Line("Here");
   select
      task1.change;
   or
      delay 1.0;
   end select;

   --task1.change;
   exception
      when Tasking_Error =>
         Put_Line("Task2 error");
         task1.change;

end test1;
