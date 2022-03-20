function More_Than(G:Grid;Max : Natural) return Natural is
   is_find :Boolean;
   tmp: Natural;
begin
   is_find := False;
   tmp := Max;
   for i in G'Range(1) loop
      for j in G'Range(2) loop
         if(is_find = False) then
            if(tmp < G(i,j)) then
               tmp:= G(i,j);
               is_find := True;
            end if;
         end if;
      end loop;
   end loop;
   return tmp;
end More_Than;
