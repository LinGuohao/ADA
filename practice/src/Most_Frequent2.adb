function Most_Frequent2(V:Vector) return Integer is
   type newArray is array(Index range<>) of Integer;
   function Count_number(E:element;j:index) return Integer is
      count: Integer;
   begin
      count := 0;
      for i in V'First..j loop
         if(E = V(i)) then
            count := count + 1;
         end if;
      end loop;
      return count;
   end Count_number;
   Multiplicity:newArray(V'Range);
   Max : Integer;
begin
   for i in V'Range loop
      Multiplicity(i) := Count_number(V(i),i);
   end loop;
   Max:= Multiplicity(Multiplicity'First);
   for i in Multiplicity'Range loop
      if (Max< Multiplicity(i)) then
         Max := Multiplicity(i);
      end if;
   end loop;
   return Max;
end Most_Frequent2;
