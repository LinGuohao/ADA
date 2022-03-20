package body PBag is


   procedure Add(b:in out Bag;e:Elem) is
      l:Boolean:=False;
   begin
      if b.Size<b.Max then

         for i in b.Data'First..b.Size loop
            if b.Data(i).Element = e then
               b.Data(i).Mult:=b.Data(i).Mult+1;
               l:=True;
            end if;

         end loop;

         if not l then
            b.Size:=b.Size+1;
            declare
               p:Pairs;
            begin

               p.Element:=e;
               p.Mult:=1;
               b.Data(b.Size):=p;
            end;
         end if;


      end if;

   end Add;



   procedure shift(a:in out TArray;i:Positive) is
   begin


      for j in i..Positive'Pred(a'Last) loop
         a(j):=a(Positive'Succ(j));
      end loop;

   end shift;



   procedure Remove(b:in out Bag;e:Elem) is
   begin
      if b.Size>0 then

         for i in b.Data'First..b.Size loop
            if b.Data(i).Element = e then
               b.Data(i).Mult:=b.Data(i).Mult-1;
               if b.Data(i).Mult=0 then
                  if b.Size=1 then
                     b.Size:=0;

                  else
                     shift(b.Data,i);
                     b.Size:=b.Size-1;
                  end if;
               end if;
            end if;
         end loop;
      end if;

   end Remove;

   function Multiplicity(b:Bag;e:Elem) return Natural is
   begin
      for i in b.Data'First..b.Size loop
            if b.Data(i).Element = e then
               return b.Data(i).Mult;

            end if;

      end loop;
      return 0;
   end Multiplicity;


   procedure For_Each(b:in out Bag) is
   begin
      for i in b.Data'First..b.Size loop
         Process_Elem(b.Data(i).Element);
      end loop;

   end For_Each;




end PBag;
