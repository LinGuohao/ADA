with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
package body pqueue_type is
   procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data ) is
      count : Integer;
      is_found :Boolean;
      newP : PQueue(PQ.Max);
      z : Integer;

   begin
      if(PQ.Pointer = 0) then
         Pq.Pointer := PQ.Pointer+1;
         PQ.parray(Pq.Pointer).num := P;
         PQ.parray(Pq.Pointer).content := D;

      elsif(PQ.Pointer+1 > PQ.Max) then
         return;
      elsif(PQ.Pointer<PQ.Max) then


         Z := 1;
         is_found:= False;
      while(is_found = False and Z<= PQ.Pointer) loop
         if(PQ.parray(Z).num <= P) then
            is_found := True;
         end if;
         Z := Z+1;
      end loop;
         if(is_found = True) then
            Z := Z-1 ;
         end if;

      if(Z = PQ.Pointer) then
         PQ.Pointer := PQ.Pointer+1;
         PQ.parray(PQ.Pointer).num := P;
         PQ.parray(PQ.Pointer).content := D;

      count := 1;
      else
         for i in 1..Z-1 loop
            newP.parray(i) :=PQ.parray(i);


         end loop;
             newP.parray(z).num := P;
            newP.parray(z).content := D;
         for i in Z..PQ.Pointer loop
            newP.parray(i+1) :=PQ.parray(i);
            newP.parray(i+1).num := PQ.parray(i).num;
            newP.parray(i+1).content := PQ.parray(i).content;
         end loop;

            newP.Pointer:= PQ.Pointer + 1;
            PQ := newP;
         end if;


      end if;








   end Insert;

   procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean ) is
   begin
      if(PQ.Pointer= 0) then
         Found:= False;
      else
         P := PQ.parray(1).num;
         D := PQ.parray(1).content;
      end if;

   end Get;
   procedure print (PQ : in PQueue) is
   begin
      for i in 1..PQ.Pointer loop
         Put(Integer(PQ.Pointer));
      end loop;

   end print;


end pqueue_type;
