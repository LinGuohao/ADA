procedure Rotate(a:in out ItemArray) is
   e:Item:=a(a'First);
begin
   for i in a'First..Index'Pred(a'Last) loop
      a(i):=a(Index'Succ(i));
   end loop;

   a(a'Last):=e;

end Rotate;
