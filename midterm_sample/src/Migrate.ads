with Ada.Text_IO;

generic
   type index is(<>);
   type Grid is array(index range<>,index range<>) of Natural;
procedure Migrate (G:in out Grid ; Max:in Natural);
