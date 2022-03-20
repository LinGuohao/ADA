package body Coords is
   function Get_X(C:Coord) return Integer is
   begin
      return C.x;
   end Get_X;

   function Get_Y(C:Coord) return Integer is
   begin
      return C.y;
   end Get_Y;

   procedure Set_X(C: in out Coord;number:in Integer) is
   begin
      C.x := number;
   end Set_X;

   procedure Set_Y(C: in out Coord;number:in Integer) is
   begin
      C.y := number;
   end Set_Y;

   function Get_Distance(C1:Coord ; C2 :Coord) return Integer is
   begin
      return ((C1.x) - (C2.x))**2 + ((C1.y) - (C2.y))**2;
   end Get_Distance;

   procedure Change_To_Direction(Cd : in Cardinal_Direction ; C:in out Coord) is
   begin
      if(Cd = N) then
         C.y := C.y - 1;
      elsif(Cd = S) then
         C.y := C.y + 1;
      elsif(Cd = E) then
         C.x := C.x + 1;
      elsif (Cd = W) then
         C.x := C.x - 1;
      elsif(Cd =NE) then
         C.x := C.x + 1;
         C.y := C.y - 1;
      elsif(Cd = SE) then
         C.x := C.x + 1;
         C.y := C.y + 1;
      elsif(Cd = SW) then
         C.x := C.x - 1;
         C.y := C.y + 1;
      elsif (Cd = NW) then
         C.x := C.x - 1;
         C.y := C.y - 1;
      end if;

    end Change_To_Direction;

   function Coord_With_Array (arr:Map;C:Coord) return Item is
   begin
      return arr(C.x,C.y);
   end Coord_With_Array;






end Coords;
