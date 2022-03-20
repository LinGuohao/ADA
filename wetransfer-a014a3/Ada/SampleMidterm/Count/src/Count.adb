function Count(g:Grid) return Natural is
   s :Natural:=0;
begin
   for I in g'Range(1) loop
      for J in g'Range(2) loop
         s := s+ g(I,J);
      end loop;
   end loop;
   return s;
end Count;
