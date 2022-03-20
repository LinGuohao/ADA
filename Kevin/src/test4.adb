with ADA.Text_IO;use ADA.Text_IO;
procedure test4 is

   task task1 is
      entry call;
      entry call2;
   end task1;

   task body task1 is
   begin
      ----
      select
         delay 20.0;
         accept call  do
            Put_Line("In call");
         end call;
      or
         --delay 10.0;
         accept call2  do
            Put_Line("In call2");
         end call2;
      or
         delay 40.0;
         Put_Line("In delay!");
      end select;




   end task1;



begin
   delay 5.0;
   task1.call2;
end test4;
