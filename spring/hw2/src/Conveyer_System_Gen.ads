generic
   type Item is (<>);
   type Index is (<>);
package Conveyer_System_Gen is
   type Conveyer (Size : Positive) is private;
   procedure Move_Robot (i : Index);
   procedure Put (i : Item);
   procedure Get;
   procedure Show;
private
   type TArray is array( Integer range <> ) of Item;
   type Conveyer(Size : Positive ) is record
      Items: TArray(1..Size) := (1 => Item'Val(0), others => Item'Val(0));
      Robot_Position : Index := Index'First;
   end record;
end Conveyer_System_Gen;
