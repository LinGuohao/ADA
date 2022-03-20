with hauntedhouse,Ada.Text_IO;use hauntedhouse,Ada.Text_IO;
procedure Main is

   type time_Pointer is access Duration;
   task type ghost(time:time_Pointer) ;
   type ghost_Pointer is access ghost;
   type ghostArray is array (Integer range<>) of ghost_Pointer;
   task princess is
      entry scared(GP:in Position);
   end princess;

   task type wizard(num:Integer;time:time_Pointer);






   task body princess is
      P:Position:=(1,3);
      Lives:Integer:=3;
      dead : Boolean:=False;
   begin
      while dead = False loop

         accept scared (GP : in Position) do
            if(P.x = GP.x and P.y = GP.y ) then
               Lives := Lives -1;
               Put_Line("Princess scared and lose one live");
            end if;
            if(Lives = 0) then
               dead := True;
               Put_Line("Princess dead!");
            end if;
         end scared;
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

   wizard1:wizard(3,new Duration'(2.0));









begin
  null;
end Main;
