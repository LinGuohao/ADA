with Coords, Card_Dir,Ada.Text_IO;use Coords,Card_Dir,Ada.Text_IO;
package body Aircraft is
   procedure Ascend(A: in out Aircraft_Type) is
   begin
      A.Is_In_The_Air := True;
   end Ascend;
   procedure Land(A : in out Aircraft_Type) is
   begin
      A.Is_In_The_Air := False;
   end Land;

   function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean is
   begin
      return A.Is_In_The_Air;
   end Get_Is_In_The_Air;

   function Get_Coord(A:Aircraft_Type) return Coord is
   begin
      return A.Position;
   end Get_Coord;

   procedure Set_Coord(A :in out Aircraft_Type ; C:in Coord) is
   begin
      A.Position := C;
   end Set_Coord;

   procedure Set_Card_Dir_Coord(A: in out Aircraft_Type; Cd: in Cardinal_Direction) is
   begin
      if(Cd = N) then
         Set_Y(A.Position,Get_Y(A.Position) - 1);
      elsif(Cd = S) then
         Set_Y(A.Position,Get_Y(A.Position) + 1);
      elsif(Cd = E) then
         Set_X(A.Position,Get_X(A.Position) + 1);
      elsif (Cd = W) then
         Set_X(A.Position,Get_X(A.Position) - 1);
      elsif(Cd =NE) then
         Set_X(A.Position,Get_X(A.Position) + 1);
         Set_Y(A.Position,Get_Y(A.Position) - 1);
      elsif(Cd = SE) then
         Set_X(A.Position,Get_X(A.Position) + 1);
         Set_Y(A.Position,Get_Y(A.Position) + 1);
      elsif(Cd = SW) then
         Set_X(A.Position,Get_X(A.Position) - 1);
         Set_Y(A.Position,Get_Y(A.Position) + 1);
      elsif (Cd = NW) then
         Set_X(A.Position,Get_X(A.Position) - 1);
         Set_Y(A.Position,Get_Y(A.Position) - 1);
      end if;



   end Set_Card_Dir_Coord;

   procedure Start(A:in out Aircraft_Type) is
   begin
      reset(gen);
      num := random(gen);
      Set_X(A.Position,num);
      reset(gen);
      num := random(gen);
      Set_Y(A.Position,num);


   end Start;

   function Get_Distance(A1:Aircraft_Type;A2: Aircraft_Type) return Integer is
   begin
      return Coords.Get_Distance(A1.Position,A2.Position);
   end Get_Distance;

   procedure Compare(A1: in Aircraft_Type;A2: in Aircraft_Type) is
   begin
      if not(A1.name  < A2.name) then
         Put_Line("bigger");
      elsif (A1.name < A2.name) then
         Put_Line("smaller");
      else
         Put_Line("equal");
      end if;
   end Compare;

   procedure Action(A : in Aircraft_Type) is
      I : Character;
      B :Boolean;
      C : Coord;
   begin
      I := A.name;
      B := A.Is_In_The_Air;
      C := A.Position;
      Op(I,B,C);

   end Action;




end Aircraft;
