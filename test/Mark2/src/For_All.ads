generic
   type Elem is (<>);
   type index is (<>);
   type Vector is array (index range<>) of Elem;
   with procedure activity(E: in out Vector);
procedure For_All( V: in out Vector );
