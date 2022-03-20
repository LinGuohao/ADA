with simpleq,Ada.Command_Line,Ada.Integer_Text_IO;
use Ada.Integer_Text_IO,simpleq;
procedure Main is
   n:Integer;
   Q:Queue(3);
begin


   -- while not isEmpty(Q) loop
   add(Q,1);
   add(Q,2);
   Put(pop(Q));
   Put(top(Q));
  -- end loop;



end Main;
