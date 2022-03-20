function More_Then(g:Grid;max:Natural) return Boolean is
   l:Boolean:=False;
   s:Natural:=0;
begin
   for I in g'Range(1) loop
      for J in g'Range(2) loop
         s := s+ g(I,J);
         if s>max then
            return True;
         end if;
      end loop;
   end loop;
   return False;
end More_Then;
