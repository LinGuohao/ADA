generic
   type element is private;
   type index is (<>);
   type Grid is array(index range<>,index range<>) of element;
   with function Op(E: element) return Boolean;
function Count_value(G:Grid) return Natural;
