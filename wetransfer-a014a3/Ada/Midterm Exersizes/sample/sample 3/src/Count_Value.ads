generic
   type Index is (<>);
   type Elem is private;
   type Grid is array (Index range <>,Index range <>) of Elem;
   with function pred(a:Elem) return Boolean;
   function Count_Value(g:Grid) return Natural;
