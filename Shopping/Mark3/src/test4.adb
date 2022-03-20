with Ada.Text_IO;use Ada.Text_IO;
procedure test4 is
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
      or
           delay 3.0;

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

   task2.call;


   Put_Line("Here");

   --exception Tasking_Error



end test4;
