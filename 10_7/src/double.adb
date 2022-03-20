procedure double(ta: in TA_Array;is_true : out Boolean ;index1 : out Integer ; index2: out Integer) is
   S :A := Searched;
   cont : Integer;
   index : Integer;
begin
   is_true := False;
   index := 0;
   cont := 0;
   index1 := -1;
   index2:= -1;
   for i in ta'Range loop
      if (ta(i) = S) then
         cont := cont + 1;
         if(cont = 1) then
            index1 := index;
         end if;
         if(cont = 2) then
            index2 := index;
         end if;

      end if;
      index := index + 1;
   end loop;

   if(cont >= 2) then
      is_true := True;
   end if;





end double;
