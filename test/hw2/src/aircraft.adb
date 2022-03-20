with Ada.Numerics.Discrete_Random,Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO,Ada.Text_IO;
package body Aircraft is
   procedure Ascend(ap:in out Aircraft_Type(name)) is
   begin
      ap.Is_In_The_Air:=True;
   end Ascend;
   
      
   procedure Land(ap:in out Aircraft_Type(name)) is
   begin
      ap.Is_In_The_Air:=False;
   end Land;
   
   function Get_Is_In_The_Air(ap:Aircraft_Type(name)) return Boolean is
   begin
      return ap.Is_In_The_Air;
   end Get_Is_In_The_Air;
   
   function Get_Coord(ap:Aircraft_Type(name)) return Coord is
   begin
      return ap.position;
   end Get_Coord;
   
   procedure Set_Card_Dir_Coord(ap:in out Aircraft_Type(name);cd:in Cardinal_Direction) is
   begin
      Change_To_Direction(cd,ap.position);
   end Set_Card_Dir_Coord;
   
   procedure Start(ap:in out Aircraft_Type) is
      package Random_Int is new Ada.Numerics.Discrete_Random(Integer);
      G:Random_Int.Generator;
   begin
      Random_Int.Reset(G);
      
      ap.position.X:=Random_int.Random(G);
      ap.position.Y:=Random_Int.Random(G);
         
   end Start;
   
   procedure Compare(ap:in out Aircraft_Type(name);ap1:in out Aircraft_Type(name1)) is
   begin
      if name<name1 then
         print("smaller");
      elsif name=name1 then
         print("equal");
      else
         print("smaller");
      end if;
   end Compare;
   
   function Get_Distance(ap:in out Aircraft_Type(name);ap1:in out Aircraft_Type(name1)) return Integer is
   begin
      return Get_Distance(ap.position,ap1.position);
   end Get_Distance;
   
   procedure Action(air_craft: in out Aircraft_Type(name)) is
   begin
      ap:=name;
      in_Air:=air_craft.IS_In_The_Air;
      position:=air_craft.position;
      Change(name,in_Air,position);
   end Action;
   
   
end Aircraft;
