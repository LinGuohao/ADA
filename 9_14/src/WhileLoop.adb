with ADa.Integer_Text_IO;
procedure WhileLoop is
   A , B: Positive;
begin
   Ada.Integer_Text_IO.Get(A);
   Ada.Integer_Text_IO.Get(B);
   while A/= B loop
      if A>B then
         A := A - B;
      else
         B := B -A;
      end if;
   end loop;
   ADA.Integer_Text_IO.Put(A);

   end WhileLoop;
