with Ada.Text_IO,Ada.Numerics.Discrete_Random, Ada.Calendar;
use Ada.Text_IO;
procedure Main is
   Gone : Exception;
   task child;

   task chicken is
      entry fed;
      entry played;
   end chicken;

   task body chicken is
      seeds:Natural:=4;

   begin
      while seeds<30 and seeds>=0 loop
         select
            accept fed do
               Put_Line("Chicken is fed!");
               seeds:=seeds+3;
               Put_Line("Number of seeds: " & seeds'Image);
            end fed;
         or
            accept played  do
               Put_Line("Boy has played with the chciken");
               seeds:=seeds-1;
               Put_Line("Number of seeds: " & seeds'Image);
            end played;
         or
            delay 1.0;
            seeds:=seeds-1;
            Put_Line("Number of seeds: " & seeds'Image);
         end select;

      end loop;

      if seeds=0 then
	raise Gone;
	else
		if seeds >= 30 then
			Put_Line("flought away!");
		end if;
      end if;


   end chicken;

  -- task body child is
   --begin
     -- loop
       --  chicken.fed;
         --chicken.played;
     -- end loop;

   --end child;

   package chickenR is new Ada.Numerics.Discrete_Random(Boolean);
use chickenR;
G: chickenR.Generator;

task body child is
B: Boolean;
begin

      loop
         B:=random(G);
         if B then
            chicken.fed;
            Put_Line("Boy is feeding the chicken");

         else
            chicken.played;
            Put_Line("Boy is playing with the chicken");
         end if;

      end loop;
   exception
      when tasking_error => Put("no chicken kid is sad!");
      when Gone => Put("chicken died , kid is sad!");
         end child;


begin
   delay(1.0);
   chickenR.reset(G);
end Main;
