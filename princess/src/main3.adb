with hauntedhouse,Ada.Text_IO,ada.numerics.discrete_random;use hauntedhouse,Ada.Text_IO;
procedure Main3 is

   type time_Pointer is access Duration;
   task type ghost(time:time_Pointer) ;
   type ghost_Pointer is access ghost;
   type ghostArray is array (Integer range<>) of ghost_Pointer;

   task princess is
      entry scared(GP:in Position);
   end princess;

   task type wizard(num:Integer;time:time_Pointer);

   task King is
      entry help(Canhelp : in out Boolean);
   end King;



   procedure NewPosition(P:in out Position) is
      type rand4 is range 1..4;
      package Rand_Int4 is new ada.numerics.discrete_random(rand4);
      use Rand_Int4;
      gen4 : Generator;
      is_Ok:Boolean;
      newP : Position;
   begin
      Reset(gen4);
      is_Ok:=False;
      while is_Ok = False loop
         newP.x := P.x;
         newP.y := P.y;
         if(Integer(Random(gen4)) = 1) then
            newP.y := newP.y-1;
         elsif(Integer(Random(gen4)) = 2) then
            newP.y := newP.y+1;
         elsif(Integer(Random(gen4)) = 3) then
            newP.x := newP.x -1;
         else
           newP.x := newP.x + 1;
         end if;
         if(IsCorrect(newP)) then
            P.x := newP.x;
            P.y := newP.y;
            is_Ok := True;
         end if;
      end loop;
   end NewPosition;








   task body princess is
      P:Position:=(1,3);
      Lives:Integer:=3;
      dead : Boolean:=False;
      Canhelp:Boolean := False;
      asked : Boolean := False;
   begin
      while dead = False loop

         accept scared (GP : in Position) do
            if(P.x = GP.x and P.y = GP.y ) then
               Lives := Lives -1;
               Put_Line("Princess scared and lose one live");
               asked:=False;
            end if;
            if(Lives = 1)then
               king.help(Canhelp);
               asked := True;
            end if;
            if(Canhelp = True and asked = False) then
               Lives := Lives + 1;
               Put_Line("Princess get 1 live");
            end if;
            if(Lives = 0) then
               dead := True;
               Put_Line("Princess dead!");
            end if;
         end scared;


         NewPosition(P);
         Put_Line("Princess now on" & Integer'Image(P.x) &" " & Integer'Image(P.y));
         if(GetField(P) = E) then
            Put_Line("Princess out!");
            exit;
         end if;
      end loop;


   end princess;

   task body ghost is
      PG:Position;
   begin
      while princess'Callable loop
         PG:= GetRandPos;
         select
            princess.scared(PG);
            Put_Line("Ghosts tried " &Natural'Image(PG.x) &" " &Natural'Image(PG.y) );
         or
            delay time.all;
         end select;
      end loop;
   end ghost;

   task body wizard is
      ghostlist : ghostArray(1..num) ;
   begin
      Put_Line(Integer'Image(num) &" ghosts are created");
      for i in 1..num loop
         ghostlist(i) := new ghost(time);
      end loop;
   end wizard;

   task body King is
      type rand4 is range 1..4;
      package Rand_Int4 is new ada.numerics.discrete_random(rand4);
      use Rand_Int4;
      gen4 : Generator;
   begin

      while princess'Callable loop
         Reset(gen4);
        select
         accept help (Canhelp : in out Boolean) do
            if(Integer(Random(gen4))>=4) then
               Canhelp:=True;
            else
               CanHelp := False;
            end if;

            end help;
         else
            null;
         end select;

      end loop;


   end King;



   wizard1:wizard(10,new Duration'(2.0));









begin
  null;
end Main3;
