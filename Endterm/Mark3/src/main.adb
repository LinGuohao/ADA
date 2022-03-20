with Ada.Text_IO;use Ada.Text_IO;
procedure Main is
   protected Printer is
      procedure Printing(S: in String);
   end Printer;

  -- protected generators is
    --  function gen return Integer;
   --end generators;
   type twoDim is array (2..10,2..10) of Boolean;
   task type Virus(x:Integer;y:Integer;dx:Integer;dy:Integer);

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
               if(i mod j = 0 or j mod i = 0) then
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
      nx:Integer;
      ny:Integer;
      is_cell : Boolean;

   begin
      delay 0.1;
      nx:=x;
      ny:=y;
      is_cell:=False;
      while is_cell = False and Organism.is_boundaries(nx,ny) loop
         Organism.move(nx,ny,is_cell);
         if(is_cell = True) then
            Printer.Printing("Virus is at "&Integer'Image(nx)&","&Integer'Image(ny)&" infects!");
            exit;
         else
            Printer.Printing("Virus is at "&Integer'Image(nx)&","&Integer'Image(ny));
         end if;
         if(dx=1) then
            nx:= nx+1;
         end if;
         if(dx = -1) then
            nx := nx-1;
         end if;
         if(dy = 1) then
            ny := ny+1;
         end if;
         if(dy=-1) then
            ny:=ny-1;
         end if;

         delay 0.1;
      end loop;


   end Virus;

   V1: Virus(2,7,1,0);
   V2: Virus(2,3,1,1);
   V3: Virus(10,2,-1,0);

begin
   Organism.Init;

end Main;
