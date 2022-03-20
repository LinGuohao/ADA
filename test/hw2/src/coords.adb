package body Coords is

   function Get_X(C:Coord) return Integer is
   begin
      return C.X;
   end Get_X;
   
   function Get_Y(C:Coord) return Integer is
   begin
      return C.Y;
   end Get_Y;
   
   procedure Set_X(C: in out Coord;x: in Integer) is
   begin
      C.X:=x;
   end Set_X;
   
   procedure Set_Y(C: in out Coord; y: in Integer) is
   begin
      C.Y:=y;
   end Set_Y;
   
   function Get_Distance(C1, C2: Coord) return Integer is
   begin 
      return (C1.X-C2.X)*(C1.X-C2.X)+ (C1.Y-C2.Y)*(C1.Y-C2.Y);
   end Get_Distance;
   
   procedure Change_To_Direction (d: in Cardinal_Direction; C:Coord)
   begin
      if d=N then
         C.Y:=C.Y-1;
      elsif d=S then
         C.Y:=C.Y+1;
      elsif d=E then
         C.X:=C.X+1;
      elsif d=W then
         C.X:=C.X-1;
      elsif d=NE then
         C.X:=C.X+1;
         C.y:=C.Y-1;
      elsif d=SE then
         C.X:=C.X+1;
         C.y:=C.Y+1;
      else
         C.X:=C.X-1;
         C.y:=C.Y-1;
      end if;
      
   end Change_To_Direction;
   
   function Coord_With_Array(C: Coord;Arr: Map) return Item is
   begin 
      for i in Arr'Range(1) loop
         for j in Arr'Range(2) loop
            if Coord.X=i and Coord.Y=j
            return Item;
         end if;
      end loop;
   end loop;
   end Coord_With_Array;
   
   

end Coords;
