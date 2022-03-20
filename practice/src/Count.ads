generic
   type index is (<>);
   type element is (<>);
   type Grid is array (index range<>,index range<>) of Natural;
function Count(n:Grid) return Natural;
