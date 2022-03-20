package body PQueue is

   type TmpArray is array( Integer range <> ) of Elem;
   cont : Integer := 0;
   procedure Push( V: in out Queue; E: in Elem ) is
      begin
          V.Pointer := V.Pointer + 1;
          V.Data(V.Pointer) := E;
   end;

   procedure Pop( V: in out Queue; E: out Elem ) is

   begin
       E:= Top(V);
      declare
         Tmp : TmpArray (1..V.Pointer - 1);
      begin
         cont := 1;
         for i in 2..V.Pointer loop
            Tmp(cont) := V.Data(i);
            cont := cont + 1;
         end loop;



            cont := 1;
            for i in 1.. V.Pointer - 1 loop
               V.Data(i) := Tmp(cont);
               cont := cont + 1;
            end loop;
         V.Pointer := V.Pointer -1 ;
         end;




   end Pop;

   function Top (V: Queue) return Elem is
   begin
      return V.Data(V.Data'First);
   end Top;

   function Is_Empty(V : Queue) return Boolean is
   begin
      return V.Pointer = 0;
   end Is_Empty;

   function Size(V:Queue) return Elem is
   begin
      return V.Pointer;
   end Size;

   function Is_Full( V: Queue ) return Boolean is
   begin
      return V.Pointer >= V.Max ;
   end Is_Full;











end PQueue;
