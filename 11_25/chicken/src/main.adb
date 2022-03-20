with Ada.Text_IO, Ada.Numerics.Discrete_Random,Ada.Calendar;
use Ada.Text_IO;
procedure Main is
   Gone: Exception;
   Fly : Exception;

   task chicken is
      entry feed;
      entry play;
   end;

   task body chicken is
      seedInStomache: Natural := 4;

   begin
      loop
      select
         accept play  do
            if(seedInStomache - 1 > 0) then
                  seedInStomache := seedInStomache - 1;
                  Put_Line("Playing with chicken " & Natural'Image(seedInStomache));
               else

               raise Gone;
            end if;
         end play;
      or
         accept feed  do
            if(seedInStomache + 3 < 30) then
                  seedInStomache := seedInStomache + 2;
                  Put_Line("Feed chicken " & Natural'Image(seedInStomache));
               else

                  raise Fly;
               end if;

            end feed;
         end select;
     end loop;
   end chicken;

      package chickenR is new Ada.Numerics.Discrete_Random(Boolean);
      use chickenR;
      G:chickenR.Generator;

      task kid;
      task body kid is
        B:Boolean;
      losingTime: Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 0.1 );


      begin
         loop
            delay until losingTime;
            B:= Random(G);
            if B then
               chicken.play;
            else
               chicken.feed;
            end if;


            losingTime := Ada.Calendar."+"( losingTime, 1.0 );
         end loop;
         exception
         when Fly => Put("Feed chicken, Flought away!");
         when Gone => Put("Play with chicken, chicken died, kid is sad!");
      end kid;


begin
   chickenR.reset(G);




end Main;
