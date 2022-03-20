generic
   type index is(<>);
   type Grid is array(index range<>,index range<>) of Natural;
function Count(G:Grid) return Natural;
