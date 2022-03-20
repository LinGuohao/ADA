generic
   type Index is (<>);
   type Grid is array (Index range <>,Index range <>) of Natural;
   function More_then(g:Grid;max:Natural) return Boolean;
