procedure reversal(a:in out Tarray) is
   --b:Tarray(a'Range);
   j:Index:=a'Last;
   ind :Index:=a'First;
begin
   while ind<j loop
      swap(a(ind),a(j));
      ind:=Index'Succ(ind);
      j:=Index'Pred(j);
   end loop;

   --a:=b;
end reversal;
