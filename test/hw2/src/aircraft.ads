with Coords,Card_Dir;
use Coords,Card_Dir;

generic
   type Id is (<>);
   with function "<" (A,B:Id) return Boolean is <>;
package Aircraft is
   
      type Aircraft_Type(Name:Id) is private;
      generic
      with procedure Change(ap:out Id;in_Air:out Boolean;position:out Coord);
      procedure Action(air_craft: in out Aircraft_Type);
      
      procedure Ascend(ap:in out Aircraft_Type);
      procedure Land(ap: in out Aircraft_Type);
      function Get_Is_In_The_Air(ap:Aircraft_Type) return Boolean;
      function Get_Coord(ap:Aircraft_Type) return Coord;
      procedure Set_Card_Dir_Coord(ap:in out Aircraft_Type;cd:in Cardinal_Direction);
      procedure Start(ap:in out Aircraft_Type);
      procedure Compare(ap:in out Aircraft_Type;ap1:in out Aircraft_Type);
      function Get_Distance(ap:Aircraft_Type;ap1:Aircraft_Type) return Integer;
      
   
   private
      type Aircraft_Type(Name:Id) is record
         position:Coord;
      IS_In_The_Air:Boolean;
   end record;
   
      
      
      
      
   
         
end Aircraft;
