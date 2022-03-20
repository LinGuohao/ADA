with Ada.Text_IO;use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
procedure Main is
   protected Printer is
      procedure Printing(S: in String);
   end Printer;

   protected generators is
      function gen return Boolean;
   end generators;
   type twoDim is array (2..10,2..10) of Boolean;
   task type Virus(x:Integer;y:Integer;dx:Integer;dy:Integer);

   protected Organism is
      procedure Init;
      entry move(x:in Integer;y: in Integer;is_cell:out Boolean;is_infected:in out Boolean);
      function is_boundaries(x:Integer;y:Integer) return Boolean;
   private
      area: twoDim;
      is_init: Boolean :=False;
   end Organism;
   subtype Virus_Type is Virus;
   type Virus_Type_Pointer is access Virus_Type;

   task Immune_System is
      entry Antibodies(destroyed: in out Boolean );
   end Immune_System;


   ---------------------------Body-----------------------------------------
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
      entry move(x:in Integer;y: in Integer;is_cell:out Boolean;is_infected:in out Boolean) when is_init is
      begin
         if(area(x,y) = True) then
            if(generators.gen) then
               area(x,y) := False;
               is_infected:=True;
               is_cell:=True;
            else
               is_cell := True;
               is_infected:=False;
            end if;
         else
               is_cell:=False;
               is_infected:=False;
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
      is_infected : Boolean;
      newVirus: Virus_Type_Pointer;
      destroyed:Boolean;
   begin
      delay 0.1;
      nx:=x;
      ny:=y;
      is_cell:=False;
      is_infected := False;
      destroyed:=False;
      while is_cell = False and Organism.is_boundaries(nx,ny) loop
         Organism.move(nx,ny,is_cell,is_infected);
         if(is_cell = True and is_infected =False) then
            Printer.Printing("Virus is at "&Integer'Image(nx)&","&Integer'Image(ny)&" Couldn't infect!");
         elsif(is_cell = True and is_infected = True) then
            Printer.Printing("Virus is at "&Integer'Image(nx)&","&Integer'Image(ny)&" infects!");
            delay 0.5;
            newVirus:=new Virus_Type(nx,ny,dx,-dy);
         elsif(is_cell = False) then
            Printer.Printing("Virus is at "&Integer'Image(nx)&","&Integer'Image(ny));
         end if;
         select
            Immune_System.Antibodies(destroyed);
         or
            delay 0.1;
         end select;

         if(destroyed) then
            Printer.Printing("Virus is destroyed!");
            exit;
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
   protected body generators is
      function gen return Boolean is
         package Random_Boolean_Generator is new Ada.Numerics.Discrete_Random(Boolean);
         use Random_Boolean_Generator;
         G : Generator;
      begin
         Reset(G);
         return Random(G);
         end gen;
   end generators;

   task body Immune_System is
   begin
      delay 0.2;
      loop
         select
            accept Antibodies (destroyed : in out Boolean) do
                  destroyed:= generators.gen;
            end Antibodies;

         or
            terminate;
         end select;
      end loop;

   end Immune_System;

   V1: Virus(2,7,1,0);
   V2: Virus(2,3,1,1);
   V3: Virus(10,2,-1,0);

begin
   Organism.Init;

end Main;
