with Ada.Text_IO;
use Ada.Text_IO;
package body PSet is
   function Make_Set (L: TArray) return Set is
      S:Set:=(others => False);
   begin
      for i in L'Range loop
         S(L(i)) := True;
      end loop;
      return S;
   end Make_Set;

   function Make_Set (E: Elem) return Set is
      S : Set:= (others => False);
   begin
      S(E) := True;
      return S;
   end Make_Set;

   function Size (S: Set) return Natural is
      count : Natural;
   begin
      count:=0;
      for i in S'Range loop
         if(S(i) = True) then
            count:= count + 1;
         end if;
      end loop;
      return count;
   end Size;


   function Decompose (S: Set) return TArray is
      T:TArray(1..Size(S));
      cont : Integer;
   begin
      cont:=1;
      for i in S'Range loop
         if(S(i) = True)then
            T(cont):= i ;
            cont := cont + 1;
         end if;
      end loop;
      return T;
   end Decompose;

   function "+" (S, T: Set) return Set is
      newS: Set:= (others => False);
   begin
      for i in S'Range loop
         if(S(i) or T(i)) then
            newS(i) := True;
         end if;
      end loop;
      return newS;
   end "+";

   function "*" (S, T: Set) return Set is
      newS: Set:=(others => False);
   begin
      for i in S'Range loop
         if(S(i)and T(i)) then
            newS(i) := True;
         end if;
      end loop;
      return newS;
   end "*";

   function "<" (E: Elem; S: Set) return Boolean is
   begin
      return S(E) ;
   end "<";

   function Contains (S, T: Set) return Boolean is
   begin
      for i in S'Range loop
         if(S(i) = True and T(i) = False) then
            return False;
         end if;
      end loop;
      return True;
   end Contains;

   procedure print_Set(S: in Set) is
   count : Integer;
   begin
      count:=0;
      for i in  S'Range loop
         count:= count + 1;
         if(S(i)) then
            Put( Elem'Image(i) & " "  );
         end if;
      end loop;
      Put(Integer'Image(count));
   end print_Set;

end PSet;
