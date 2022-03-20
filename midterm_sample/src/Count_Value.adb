function Count_value(G:Grid) return Natural is
   count: Natural;
begin
   count:=0;
   for i in G'Range(1) loop
      for j in G'Range(2) loop
         if(Op(G(i,j))) then
            count := count + 1;
         end if;

      end loop;
   end loop;
   return count;
end Count_value;
