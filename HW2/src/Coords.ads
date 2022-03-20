with Card_Dir;use Card_Dir;
package Coords is
   type Coord is private;
   function Get_X(C:Coord) return Integer;
   function Get_Y(C:Coord) return Integer;
   procedure Set_X(C: in out Coord;number:in Integer);
   procedure Set_Y(C: in out Coord;number:in Integer);
   function Get_Distance(C1:Coord ; C2 :Coord) return Integer;
   procedure Change_To_Direction(Cd : in Cardinal_Direction ; C:in out Coord);
   generic
      type Item is private;
      type Map is array(Integer range<> , Integer range<>) of Item;
   function Coord_With_Array (arr:Map;C:Coord ) return Item;

private
   type Coord is record
      x : Integer;
      y : Integer;
   end record;
end Coords;
