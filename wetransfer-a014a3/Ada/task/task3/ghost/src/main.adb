with tools,hauntedhouse,Ada.Text_IO;
use tools,hauntedhouse,Ada.Text_IO;
procedure Main is

   task Princess is
      entry Scare(pos:Position);
   end Princess;

   task body Princess is
      live:Natural:=3;
      p:Position:=(1,3);
   begin
      while live>0 loop
         accept Scare (pos : in Position) do
            if p.x=pos.x and p.y=pos.y then
               live:=live-1;
               Put_Line("The princess is scared.Life remaining: " & Integer'Image(live));
            end if;

         end Scare;
      end loop;

   end Princess;



   task type Ghost;
   task body Ghost is
      pos:Position:=GetRandPos;
   begin
      while Princess'Callable loop
         Put_Line("Ghost tried to scare her");
         Princess.Scare(pos);
         pos:=GetRandPos;
         delay 0.2;
      end loop;

   end Ghost;


   g:Ghost;
   g2:Ghost;
   g3:Ghost;
begin
   null;
end Main;
