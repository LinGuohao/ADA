function More_then(g:Grid;max:Natural) return Boolean is

begin
   for i in g'Range(1) loop
      for j in g'Range(2) loop
         if g(i,j)>max then
            return False;
            end if;
      end loop;
   end loop;

   return True;
end More_then;
