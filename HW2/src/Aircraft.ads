with Coords, Card_Dir,ada.numerics.discrete_random;use Coords,Card_Dir;
generic
   type ID is private;
   with function "<" (left,right : ID) return Boolean is <>;


package Aircraft is
   subtype randRange is Integer range 0..100;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   num : randRange;
   type Aircraft_Type(I :Character) is record
      name: Character:= I;
      Position : Coord;
      Is_In_The_Air : Boolean;
   end record;
   procedure Ascend(A: in out Aircraft_Type);
   procedure Land(A: in out Aircraft_Type);
   function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean;
   function Get_Coord(A:Aircraft_Type) return Coord;
   procedure Set_Coord(A :in out Aircraft_Type ; C:in Coord);
   procedure Set_Card_Dir_Coord(A: in out Aircraft_Type; Cd: in Cardinal_Direction);
   procedure Start(A:in out Aircraft_Type);
   procedure Compare(A1: in Aircraft_Type;A2: in Aircraft_Type);
   function Get_Distance(A1:Aircraft_Type;A2: Aircraft_Type) return Integer;
   generic
     with procedure Op(I:out Character; B:out boolean; C:out Coord);
   procedure Action(A : in Aircraft_Type);





end Aircraft;




