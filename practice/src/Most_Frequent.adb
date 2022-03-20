function Most_Frequent(V:Vector) return element is
   function Multiplicity(Pattern :element) return Natural is
      count:Natural;
   begin
      count :=0;
      for i in V'Range loop
         if (V(i) = Pattern) then
            count:= count + 1;
         end if;
      end loop;
      return count;
   end Multiplicity;
   ans:element;
   max: Natural;
begin
   max :=0;
   for i in V'Range loop
      if(max < Multiplicity(V(i))) then
         ans:= V(i);
         max:= Multiplicity(V(i));
      end if;
   end loop;
   return ans;
end Most_Frequent;
