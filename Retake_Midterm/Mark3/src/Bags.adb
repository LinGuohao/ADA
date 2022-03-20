package body Bags is
   procedure Add(B: in out Bag; e: Element) is
   begin
      B.Data(e):=B.Data(e)+1;
   end Add;

   function Multiplicity(B: in Bag; e: Element) return Natural is
   begin
      return B.Data(e);
   end Multiplicity;
end Bags;
