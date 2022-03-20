generic
   type Index is (<>);
   type Grid is array (Index range <>, Index range <>) of Natural;

function More_Then(g: Grid;max:Natural) return Boolean;
