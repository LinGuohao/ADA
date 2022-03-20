generic
   type Index is (<>);
   type Elem is private;
   type Vector is array (Index range <>) of Elem;


   function mos_f(a:Vector) return Elem;
