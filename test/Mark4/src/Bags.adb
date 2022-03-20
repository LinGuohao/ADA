with For_All;
package body Bags is
   procedure Add(B: in out Bag; e: Element) is
   begin
      B.Data(e):=B.Data(e)+1;
   end Add;

   function Multiplicity(B: in Bag; e: Element) return Natural is
   begin
      return B.Data(e);
   end Multiplicity;

   procedure Remove_Duplicates(B:in out Bag) is
      procedure SetOne(B:in out TArray) is
      begin
         for i in B'Range loop
            B(i):=1;
         end loop;
      end SetOne;

      procedure MyFor_all is new For_All(Natural,Element,TArray,SetOne);
   begin
      MyFor_all(B.Data);
   end Remove_Duplicates;

end Bags;
