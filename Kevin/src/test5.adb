with ADA.Text_IO;use ADA.Text_IO ;
--  Accept can not be called again when its running
procedure test5 is
   task task1 is
      entry call;
   end task1;

   task body task1 is
   begin
      accept call  do
         Put_Line("In call");
         delay 10.0;
      end call;
   end task1;

   task type people;
   task body people is
   begin
      task1.call;
   end people;

   people1:people;
   people2:people;


begin


end test5;
