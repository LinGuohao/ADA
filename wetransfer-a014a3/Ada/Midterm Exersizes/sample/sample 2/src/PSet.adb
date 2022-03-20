with Ada.Text_IO;
use Ada.Text_IO;
package body PSet is


   function Make_Set (L: TArray) return Set is
      s:Set;
   begin
      for i in L'Range loop
         s.Data(L(i)):=True;
         s.Size:=s.Size+1;
      end loop;

      return s;
   end Make_Set;

   function Make_Set (E: Elem) return Set is
   s:Set;
   begin
      s.Data(E):=True;
      s.Size:=1;
      return s;
   end Make_Set;


   function Decompose (S: Set) return TArray is
      a:TArray(1..S.Size);
      ind:Positive:=1;
   begin
      --Put(Natural'Image(S.Size));
      for i in S.Data'Range loop
         if S.Data(i) then
        --    Put(Positive'Image(ind));
          --  Put(Elem'Image(i));
           -- Put(Elem'Image(a(1)));
            a(ind):=i;
            ind:=ind+1;
         end if;
      end loop;

      return a;
   end Decompose;


   function "+" (S, T: Set) return Set is
      set1:Set;
      n:Natural:=0;
   begin
      for i in S.Data'Range loop
         if S.Data(i) or T.Data(i) then
            set1.Data(i):=True;
            n:=n+1;
         end if;
      end loop;
      set1.Size:=n;
      return set1;
   end "+";


   function "*" (S, T: Set) return Set is
      set1:Set;
      n:Natural:=0;
   begin
      for i in S.Data'Range loop
         if S.Data(i) and T.Data(i) then
            set1.Data(i):=True;
            n:=n+1;
         end if;
      end loop;
      set1.Size:=n;
      return set1;
   end "*";


   function "<" (E: Elem; S: Set) return Boolean is
   begin
      return S.Data(E);
   end "<";


   function Contains (S, T: Set) return Boolean is
      l:Boolean:=True;
      i:Elem:=S.Data'First;
   begin
      while i<S.Data'Last and l loop
         if S.Data(i) then
            l:=T.Data(i);
         end if;
         i:=Elem'Succ(i);
      end loop;

      return l;

   end Contains;

   function Size (S: Set) return Natural is
   begin
      return S.Size;
   end Size;

   procedure print_Set(S: in Set) is
   begin
      Put_Line("The set:");
      for i in S.Data'Range loop
         if S.Data(i) then
            Put_Line(Elem'Image(i));

         end if;
      end loop;
      Put_Line("End of set");

   end print_Set;


end PSet;
