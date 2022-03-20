generic
   type index is (<>);
   type Grid is array (index range<>,index range<>) of Natural;
function More_Than(G:Grid;Max:Natural) return Boolean;
