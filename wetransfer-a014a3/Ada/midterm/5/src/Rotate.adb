procedure Rotate(a:in out ItemArray;l:Boolean) is
   e:Item:=a(a'First);
   f:Item:=a(a'Last);
begin
   if l then

      for i in a'First..Index'Pred(a'Last) loop
         a(i):=a(Index'Succ(i));
      end loop;

      a(a'Last):=e;

   else
      for i in reverse Index'Succ(a'First)..a'Last loop
         a(i):=a(Index'Pred(i));
      end loop;

      a(a'First):=f;
   end if;


end Rotate;
