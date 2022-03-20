package SBag is
   subtype Elem is Integer;
   type Bag is limited private;
   type Item is limited private;
   procedure insert_one(B: in out Bag ; S: Integer);
   procedure insert_multiple(B: in out Bag ; S: Integer ; Num:Integer);
   procedure extract_one(B : in out Bag ; S: in Integer; extracted : out Item);
   procedure extract_multiple(B :in out Bag ; S: in Integer ; Num:in Integer; extracted: in out Item);
   function is_empty(B:Bag) return Boolean;
   procedure print(B:in Bag);
   procedure arrange(B: in out Bag);
   procedure print (E: in Item);



private
   type Item is record
      Data: Integer;
      Number : Integer;

   end record;
   type newarray is array( Integer range <> ) of Item;
   type Bag is record
      Data: newarray(1..100);
      Pointer: Natural := 0;
   end record;




end SBag;
