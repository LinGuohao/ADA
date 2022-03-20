function Count(G:Grid) return Natural is
   cont:Natural;
begin
   cont:=0;
   for i in G'Range(1) loop
      for j in G'Range(2) loop

         cont:= cont + G(i,j);
      end loop;
   end loop;
   return cont;
end Count;
