generic
   type Elem is limited private;
   type Index is (<>);
   type Tarray is array (Index range <>) of Elem;
   with procedure swap(a,b: in out Elem);

   procedure reversal(a:in out Tarray);
