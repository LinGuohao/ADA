generic
   type index is (<>);
   type element is (<>);
   type Vector is array(index range<>) of element;
function Has_Repetition(V:Vector) return Boolean;
