with Ada.Text_IO;use Ada.Text_IO;
procedure test2 is
   task task1 is
      entry call;
      entry change;
      entry changeCanCall;
   end task1;

   task task2;
   task body task2 is
   begin
      delay 5.0;
      Put_Line("Will change Cancall!");
      task1.changeCanCall;

   end task2;


   task body task1 is
      a : Boolean;
      cancall : Boolean;
   begin
      a := True;
      cancall := False;
      while a loop
         select
            when cancall =>
               accept call  do
                  Put_Line("In call");
               end call;
         or
            accept change  do
               a:=False;
            end change;
         or
            accept changeCanCall  do
               cancall := True;
            end changeCanCall;
         end select;

      end loop;
   end task1;




begin

   select
      task1.call;
   or
      delay
        10.0;
   end select;
   Put_Line("Here");
   task1.change;





   --task1.change;




end test2;
