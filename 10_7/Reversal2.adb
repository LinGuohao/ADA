procedure Reversal2(ta: in out TA_Array) is
   cont : Integer;
   index : Integer;
   index2 : Integer;
begin
   cont := 1;
   index := ta'First;
   -- copy
   index2 := ta'Last;
   while (index2 /= index) loop
      Swap(ta(index2), ta(index));
      index := Integer'Succ(index);
      index2 := Integer'Pred(index2);



   end loop;

end Reversal2;
