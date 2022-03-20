generic
   type index is (<>);
   type element is private;
   type Vector is array (index range<>) of element;
function Has_Repetition (V : Vector) return Boolean;
