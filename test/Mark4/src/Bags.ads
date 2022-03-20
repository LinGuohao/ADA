generic
   type Element is (<>);
package Bags is

   type Bag is limited private;
   type TArray is array (Element range<>) of Natural;
   procedure Add(B: in out Bag; e: Element);
   function Multiplicity(B: in Bag; e: Element) return Natural;
   procedure Remove_Duplicates(B:in out Bag);
private
   type Bag is record
        Data: TArray(Element'First..Element'Last);

    end record;
end Bags;
