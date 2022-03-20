generic
   type index is (<>);
   type element is private;
   type Vector is array (index range<>) of element;
function Most_Frequent (V:Vector) return element;
