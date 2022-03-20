with card_dir;
use card_dir;
package Coords is
   
   type Coord is private;
   
   function Get_X(C:Coord) return Integer;
   function Get_Y(C:Coord) return Integer;
   procedure Set_X(C: in out Coord;x: in Integer);
   procedure Set_Y(C: in out Coord; y: in Integer);
   function Get_Distance(C: Coord) return Integer;
   procedure Change_To_Direction (d: in Cardinal_Direction; C:Coord);
   generic
      type Item is private;
      type Map is array(Integer range<>, Integer range<>) of Item;
      function Coord_With_Array(Arr: Map;C:Coord) return Item;
   
private
   type Coord is record
      X:Integer;
      Y:Integer;
   end record;
   

   
   

end Coords;
