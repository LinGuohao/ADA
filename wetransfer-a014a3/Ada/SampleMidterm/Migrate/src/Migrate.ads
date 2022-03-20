generic
   type Index is (<>);
   type Grid is array (Index range <>, Index range <>) of Natural;

   procedure Migrate(g:in out Grid ; max : Natural);
