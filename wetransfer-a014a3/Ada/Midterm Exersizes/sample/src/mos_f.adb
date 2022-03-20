with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
function mos_f(a:Vector) return Elem is

   type Multiplicit is array (Index range <>) of Positive;

   arr:Multiplicit(a'Range):=(others=>1);

   max:Index:=a'First;
   --maxV:Positive:=Multiplicity(max);
begin

   for i in reverse arr'Range loop
      for j in arr'First..Index'Pred(i) loop
         if a(i)= a(j) then
            arr(i):=arr(i)+1;
            Put(arr(i));
         end if;

      end loop;

   end loop;

   for i in Index'Succ(a'First)..a'Last loop
      if arr(max)<=arr(i) then
         max:=i;
      end if;

   end loop;

   return a(max);
end mos_f;
