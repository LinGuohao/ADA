generic
   type Index is (<>);
   type Elem is private;
   type Vector is array (Index range <>) of Elem;


   function most_frequent(a:Vector) return Elem;
