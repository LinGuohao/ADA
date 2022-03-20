with Ada.Text_IO;use Ada.Text_IO;
procedure Main is
   protected Printer is
      procedure Printing(S: in String);
   end Printer;

  -- protected generators is
    --  function gen return Integer;
   --end generators;
   type twoDim is array (2..10,2..10) of Boolean;
   task Virus;

   protected Organism is
      procedure Init;
      entry move(x:in Integer;y: in Integer;is_cell:out Boolean);
      function is_boundaries(x:Integer;y:Integer) return Boolean;
   private
      area: twoDim;
      is_init: Boolean :=False;
   end Organism;
   ---------------------------Body--------------------------------
   protected body Printer is
      procedure Printing(S: in String) is
      begin
         Put_Line(S);
      end Printing;
   end Printer;

   protected body Organism is
      procedure Init is
      begin
         for i in 2..10 loop
            for j in 2..10 loop
               if(i=j) then
                  area(i,j) := True;
               else
                  area(i,j) := False;
               end if;
            end loop;
         end loop;
         is_init:=True;
      end Init;
      entry move(x:in Integer;y: in Integer;is_cell:out Boolean) when is_init is
      begin
         if(area(x,y) = True) then
            is_cell := True;
         else
            is_cell:=False;
         end if;
      end move;

      function is_boundaries(x:Integer;y:Integer) return Boolean is
      begin
         if(x<2 or x>10 or y<2 or y>10) then
            return False;
         else
            return True;
         end if;
      end is_boundaries;

   end Organism;

   task body Virus is
      x:Integer;
      y:Integer;
      is_cell : Boolean;
   begin
      delay 0.1;
      x:= 2;
      y:= 7;
      is_cell:=False;
      while is_cell = False and Organism.is_boundaries(x,y) loop
         Organism.move(x,y,is_cell);
         if(is_cell = True) then
            Printer.Printing("Virus is at "&Integer'Image(x)&","&Integer'Image(y)&" infects!");
            exit;
         else
            Printer.Printing("Virus is at "&Integer'Image(x)&","&Integer'Image(y));
         end if;
         x:=x+1;
         delay 0.1;
      end loop;


   end Virus;

begin
   Organism.Init;
end Main;
