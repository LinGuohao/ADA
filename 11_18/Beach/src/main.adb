with Ada.Text_IO;use Ada.Text_IO;

procedure Main is

   int : Integer;
   task T is

      entry sand;
   end T;

   task body T is
      begin
      accept sand  do
         int := 1;
         for i in 1..10 loop
            if (int = 1) then
               Put_Line("Sand");
               int := 2;
               delay Duration(1);
            elsif (int = 2) then
               Put_Line("Left");
               int := 3;
               delay Duration(1);
            elsif(int = 3) then
               Put_Line("Right");
               int := 1;
               delay Duration(1);
            end if;
         end loop;



      end sand;
   end T;


begin
  T.sand;
end Main;


