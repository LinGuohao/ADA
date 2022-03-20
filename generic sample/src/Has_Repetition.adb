function Has_Repetition (V : Vector) return Boolean is
   is_true :Boolean;
   cont :Integer;
begin
   is_true := False;
   cont := 0;
   for i in V'Range loop
      if(cont+1 < V'Length)then
          if(V(i) = V(index'Succ(i))) then
            is_true := True;
            end if;
      end if;
      cont:= cont +1;
   end loop;
return is_true;
end Has_Repetition;
