with Ada.Text_IO,tools,hauntedhouse;
use Ada.Text_IO,tools,hauntedhouse;
procedure Main is

   task princess is
      entry getScared(p:Position);
   end princess;
   task king is
      entry call;
   end king;

   type direction is (left,right,up, down);

   package rand is new tools.Random_Generator(direction);

   type durPtr is access Duration;

   task type ghost(name:Natural;time:durPtr);

   task body princess is
      lives:Natural:=3;
      pos : Position:=(1,3);

      procedure move is
         tmp:Position;
         d:direction;
      begin
         loop
            tmp:=pos;
            d:=rand.GetRandom;
            case d is
               when up => tmp.y:=pos.y+1;
               when down => tmp.y:=pos.y-1;
               when left => tmp.x:=pos.x-1;
               when right => tmp.x:=pos.x+1;

            end case;

            exit when IsCorrect(tmp);
         end loop;
         pos:=tmp;

      end;


   begin
      while lives>0 and GetField(pos)/=E loop
         select
            accept getScared (p : in Position) do
               if(p.x=pos.x and p.y=pos.y) then
                  if lives=1 then
                     if king'Callable then
                        select
                           king.call;
                        else

                           lives:=lives-1;
                           Output.Puts("Princess was scared. Number of lives left: "& lives'Image,1);
                        end select;
                     else
                        lives:=lives-1;
                        Output.Puts("Princess was scared. Number of lives left: "& lives'Image,1);
                     end if;


                  else
                     lives:=lives-1;
                     Output.Puts("Princess was scared. Number of lives left: "& lives'Image,1);
                  end if;

               end if;

            end getScared;
            move;
         --or
           --   when lives=1 =>king.call ;
         end select;

      end loop;
      if GetField(pos)=E then
         Output.Puts("Princess escaped!",1);
      else

         Output.Puts("Princess died",1);
      end if;

   end princess;

   task body ghost is
      pos: Position:=GetRandPos;
   begin
      while princess'Callable loop
         select
            princess.getScared(pos);
            Output.Puts("Ghost "&name'Image&" tried to scare princess",1);
            pos:=GetRandPos;
         or
            delay time.all;
         end select;

      end loop;

   end ghost;

   type ghostPtr is access ghost;

   task type Wizzard(num:Natural;time:durPtr);

   task body Wizzard is
      g: ghostPtr;
   begin
      for i in 1..num loop
         g:=new ghost(i,time);
      end loop;

   end Wizzard;



   task body king is

      helps : Natural := 0;	-- nr helps
   begin
      loop
         select
            when helps < 3 => accept call do
                  helps := helps + 1;
                  OutPut.Puts("*************Joe " & Natural'Image(helps) & ". help.********************", 1);
               end call;
         or terminate;
         end select;
         delay 3.0;
      end loop;
   end king;



   type WizzPtr is access Wizzard;

    w:WizzPtr;
begin
   w:=new Wizzard(3,new Duration'(0.2));
end Main;
