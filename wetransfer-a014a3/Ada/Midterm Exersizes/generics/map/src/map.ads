generic
   type Index is (<>);
   type A is private;
   type B is private;
   type Tarray is array (Index range <>) of A;
   type Tb is array (Index range <>) of B;
   with function op(x:A) return B;

function Map(x: Tarray) return Tb;
