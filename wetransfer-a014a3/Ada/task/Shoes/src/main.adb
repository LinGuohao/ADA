with Text_IO;
use Text_IO;
procedure Main is

   task Left is
	entry print;
   end Left;

   task body Left is
   begin

      accept print do
         --for i in 1..5 loop
            Put_Line("Left");
         --end loop;

      end print;

   end Left;


   task Right is
	entry print;
   end Right;
   task body Right is
   begin

      accept print do
         --for i in 1..5 loop
            Put_Line("Right");
         --end loop;

      end print;

   end Right;


   task Sand;

   task body Sand is
      b: Boolean:=true;
   begin
      for i in 1..10 loop
         if b then
            Left.print;
            b:=false;
            delay 1.0;
         else
            Right.print;
            b:=true;
            delay 1.0;
         end if;
      end loop;

   end Sand;



begin
   --  Insert code here.
   null;
end Main;
