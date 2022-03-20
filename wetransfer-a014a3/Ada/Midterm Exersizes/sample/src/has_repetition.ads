generic
   type Index is (<>);
   type Elem is private;
   type Vector is array (Index range <>) of Elem;

   function has_repetition(a:Vector) return Boolean;
