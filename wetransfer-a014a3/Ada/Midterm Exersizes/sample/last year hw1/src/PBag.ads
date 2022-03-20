generic
   type Elem is private;
package PBag is

   type Bag(Max:Positive) is private;


   procedure Add(b:in out Bag;e:Elem);
   procedure Remove(b:in out Bag;e:Elem);
   function Multiplicity(b:Bag;e:Elem) return Natural;

   generic
      with procedure Process_Elem(e:in out Elem);
      procedure For_Each(b:in out Bag);


private

   type Pairs is record
      Element:Elem;
      Mult:Natural;
   end record;


   type TArray is array (Positive range <>) of Pairs;

   type Bag(Max:Positive) is record
      Data:TArray(1..Max);
      Size:Natural:=0;

   end record;


end PBag;

