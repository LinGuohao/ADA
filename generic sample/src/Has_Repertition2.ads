generic
   type index is (<>);
   type element is private;
   type Vector is array (index range<>) of element;
function Has_Repertition2 (V:Vector) return Integer;
