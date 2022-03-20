function More_Than(G:Grid;Max:Natural) return Boolean is
is_found : Boolean;
begin
   is_found := False;
   for i in G'Range(1) loop
      for j in G'Range(2) loop
         if(G(i,j) > Max) then
            is_found:= True;
         end if;
      end loop;
   end loop;
   return is_found;
end More_Than;
