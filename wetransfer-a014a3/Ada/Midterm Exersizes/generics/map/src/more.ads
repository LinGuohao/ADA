generic

   type Index is (<>);
   type Elem is limited private;
   type Tarray is array (Index range <>) of Elem;
   with function "="(a,b:Elem) return Boolean ;--is <>;
   procedure more(a:Tarray;l:out Boolean;ind1,ind2:out Index);
