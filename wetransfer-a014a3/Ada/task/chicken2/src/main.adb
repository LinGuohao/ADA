with Ada.Text_IO,Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
procedure Main is

   Gone:exception;
   Flew:exception;

   task child;
   task chicken is
      entry fed;
      entry play;
   end chicken;

   task body chicken is
      seeds:Integer:=4;
   begin
      while seeds<30 and seeds>0 loop
         select
            accept fed  do
               Put_Line("Chicken is fed!");
               seeds:=seeds+1;
               Put_Line("Current number of seeds: "& seeds'Image);
            end fed;
         or
            accept play  do
               Put_Line("Chicken is playing with child!");
               seeds:=seeds-1;
               Put_Line("Current number of seeds: "& seeds'Image);
            end play;
         or
            delay 1.0;
            Put_Line("After 1 second chicken lost energy");
            seeds:=seeds-1;
            Put_Line("Current number of seeds: "& seeds'Image);
         end select;
         if seeds=0 then
            Put_Line("Chicken died");
            raise Gone;
         elsif seeds=30 then
            Put_Line("Chcicken flew away");
            raise Flew;
         end if;

      end loop;

   end chicken;

   package rand is new Ada.Numerics.Discrete_Random(Boolean);
   use rand;
   Bo:rand.Generator;

   task body child is
      b:Boolean;
   begin
      loop
         rand.reset(Bo);
         b:=rand.Random(Bo);
         if b then
            chicken.fed;
         else
            --delay 2.0;
            chicken.play;
         end if;
      end loop;
   exception
      when Gone => Put_Line("Child is sad cuz chicken died");
      when Flew => Put_Line("Child sad that chicken flew away");
      when Tasking_Error=> Put_Line("Child is sad");




   end child;


begin
   --  Insert code here.
   null;
end Main;
