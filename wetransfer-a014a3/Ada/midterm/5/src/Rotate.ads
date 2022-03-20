generic
   type Item is private;
   type Index is (<>);
   type ItemArray is array(Index range <>) of Item;
   procedure Rotate(a:in out ItemArray;l:Boolean);
