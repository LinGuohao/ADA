function most_frequent(a:Vector) return Elem is



   function Multiplicity(Pattern:Elem) return Positive is
      cnt:Natural:=0;
   begin
      for i in a'Range loop
         if a(i)=Pattern then
            cnt:=cnt+1;
         end if;
      end loop;
      return cnt;
   end Multiplicity;


   max:Elem:=a(a'First);
   maxV:Positive:=Multiplicity(max);

begin
   for i in Index'Succ(a'First)..a'Last loop
      if maxV<Multiplicity(a(i)) then
         max:=a(i);
         maxV:=Multiplicity(a(i));
      end if;

   end loop;

   return max;
end most_frequent;
