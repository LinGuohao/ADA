procedure more(a:Tarray;l:out Boolean;ind1,ind2:out Index) is
  j:Index;
begin
   for i in a'First..Index'Pred(a'Last) loop
      j:=Index'Succ(i);
      if a(i)=a(j) then
         ind1:=i;
         ind2:=j;
         l:=True;
         return;
      end if;

      while j<a'Last loop
         if a(i)=a(j) then
            ind1:=i;
            ind2:=j;
            l:=True;
            return;
         end if;

         j:=Index'Succ(j);
      end loop;

   end loop;
   l:=False;

end more;
