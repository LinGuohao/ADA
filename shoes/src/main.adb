with ADA.Text_IO;use ADA.Text_IO;
procedure Main is

   task sand is
      entry right_foot;
      entry left_foot;
   end sand;
   task left;
   task right;
   ----------------body-----------------
   task body sand is
      is_left:Boolean:=True;
      i:Integer:=1;
   begin
      while i<=10 loop
         if(is_left = True) then
            accept left_foot  do
               Put_Line("Left");
               is_left:=False;
               i:=i+1;
            end left_foot;
            delay 0.5;
            Put_Line("Sand");
            i:= i+ 1;
         end if;
         delay 0.5;
         if(is_left = False) then
            accept right_foot  do
               Put_Line("Right");
               is_left:=True;
               i:=i+1;
            end right_foot;
            delay 0.5;
            Put_Line("Sand");
            i:= i+1;
         end if;
      end loop;
   end Sand;

   task body left is
   begin
      while sand'Callable loop
         sand.left_foot;
      end loop;
   end left;

   task body right is
   begin
      while sand'Callable loop
         sand.right_foot;
      end loop;
   end right;



begin
   --  Insert code here.
   null;
end Main;
