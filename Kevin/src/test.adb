with Ada.Text_IO;use Ada.Text_IO;
procedure test is
task task1 is
   entry into;
end task1;

task task2 is
   entry output;
end task2;

task body task2 is
begin

      select
         accept output do
            Put_Line("output");
         end output;
      or
           delay 3.0;
      end select;

end task2;


task body task1 is
begin
   loop
      select
            accept into do
               delay 5.0;
               task2.output;
            end into;

         or
            terminate;
         end select;



   end loop;
   end task1;

begin
   task1.into;
end test;
