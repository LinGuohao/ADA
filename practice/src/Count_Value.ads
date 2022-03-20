generic
   type index is (<>);
   type element is (<>);
   type Grid is array (index range<>,index range<>) of element;
   with function Op(e:element) return Boolean;
function Count_Value (G:Grid) return Natural;
