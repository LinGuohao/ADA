function Has_Repetition(V:Vector) return Boolean is
begin
   for i in V'First..Index'Pred(V'Last) loop
      if (V(i) = V(Index'Succ(i))) then
         return True;
      end if;
   end loop;
   return False;
end Has_Repetition;
