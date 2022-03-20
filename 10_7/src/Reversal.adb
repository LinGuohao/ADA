function Reversal(ta: TA_Array) return TB_Array is
   tb: TB_Array(1..ta'Length);
   cont : Integer;
   index : Integer;
   tmp : A;
begin
   cont := 1;
   index := ta'Last;
   while (cont /= ta'Length+1) loop
      tmp := ta(index);
      tb(cont):= tmp;
      index := Integer'Pred(index);
      cont := cont + 1;
   end loop;
   return tb;

end Reversal;
