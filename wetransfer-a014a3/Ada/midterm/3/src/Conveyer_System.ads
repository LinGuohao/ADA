generic
   type Item is (<>);
   type Index is (<>);

package Conveyer_System is

   type Conveyer(max:Index) is limited private;

   procedure Move_Robot(a:in out Conveyer;i:Index);
   procedure Put(a:in out Conveyer;e:Item);
   function Get(a:Conveyer) return Item;
   procedure Show(a:in Conveyer);
   procedure Move(a:in out Conveyer);

private

   type TArray is array(Index range <>) of Item;

   type Conveyer(max:Index) is record
      Items:TArray(Index'First..max):=(others=>Item'Val(0));
      Robot_Position:Index:=Index'First;
   end record;

end Conveyer_System;
