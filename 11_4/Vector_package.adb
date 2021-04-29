with Ada.Text_IO , Ada.Integer_Text_IO;
package body Vector_package is
   function size(V: Vector) return Natural is
   begin
      return V.Pointer;
   end size;

   function first(V: Vector) return Integer is
   begin
      if(V.Pointer /= 0) then return V.Data(1);else raise Empty_Vector; end if;
   end first;

   function last(V: Vector) return Integer is
   begin
      return V.Data(V.Pointer);
   Exception
         when Constraint_Error => raise Empty_Vector;
   end last;

   function is_Empty (V: Vector) return Boolean is
   begin
      if(V.Pointer = 0) then return True ; else return False; end if;
   end is_Empty;

   procedure insert(V: in out Vector; number: Integer) is
   begin

         V.Pointer := V.Pointer + 1;
         V.Data(V.Pointer) := number;
   Exception
         when Constraint_Error => raise Full_Vector;

   end insert;

   procedure assign(V: in out Vector; n, number: Integer ) is
   begin
      if(V.Pointer + n <= V.Max) then
         for i in 1..n loop
            V.Pointer:=V.Pointer + 1;
            V.Data(V.Pointer) := number;
         end loop;
      else
         Ada.Text_IO.Put_Line("Unable to insert");
         raise Full_Vector;
      end if;
   end assign;

   procedure pop(V: in out Vector) is
   begin
      if(V.Pointer /= 0) then
         V.Pointer := V.Pointer - 1;
      else
         raise Empty_Vector;
      end if;

   end pop;

   procedure remove(V: in out Vector; number: Integer; all_occurrences: Boolean:= False) is
   cont : Integer;
   index : Integer;
   begin
     if(all_occurrences = False) then
         cont:= 0;
         index := 1;
         for i in 1..V.Pointer loop
            if(V.Data(i) = number) then
               if(cont = 1) then
               V.Data(index) := V.Data(i);
               index := index+1;
               else
                  cont := cont + 1;
               end if;
            else
               V.Data(index) := V.Data(i);
               index:=index + 1;

         end if;
         end loop;

         if(cont /= 0) then
            V.Pointer := V.Pointer - 1;
         end if;

      end if;

      if(all_occurrences = True) then
         index :=1;
         for i in 1..V.Pointer loop
            if(V.Data(i) /= number) then
               V.Data(index) := V.Data(i);
               index:= index+1;
            end if;
         end loop;
         V.Pointer := index - 1;

      end if;

   end remove;

   procedure swap(V1, V2: in out Vector) is
      size1 : Integer;
      size2 : Integer;
      tmp:Integer;
   begin
      size1 := V1.Pointer;
      size2 := V2.Pointer;
      if(size1 >= size2) then
         for i in 1..size1 loop
            if(i <= size2) then
               tmp:= V1.Data(i);
               V1.Data(i):= V2.Data(i);
               V2.Data(i) := tmp;
            else
               V2.Data(i) := V1.Data(i);
            end if;
         end loop;
         V2.Pointer := size1;
         V1.Pointer := size2;
      else
          for i in 1..size2 loop
            if(i <= size1) then
               tmp:= V1.Data(i);
               V1.Data(i):= V2.Data(i);
               V2.Data(i) := tmp;
            else
               V1.Data(i) := V2.Data(i);
            end if;
         end loop;
         V2.Pointer := size1;
         V1.Pointer := size2;
      end if;
   end swap;

   procedure join(V1, V2: in out Vector) is
      size1:Integer;
      size2:Integer;

   begin
      size1 := V1.Pointer;
      size2 := V2.Pointer;
      if(size1 + size2 <= V1.Max) then
         for i in 1..size2 loop
            insert(V1,V2.Data(i));
         end loop;
      else
         raise Full_Vector;
      end if;

   end join;
   function compare(V1, V2: Vector) return Boolean is
      is_true : Boolean;
      tmp : Boolean;
   begin
      is_true:= True;
      if(size(V1) /= size(V2)) then
         return False;
      else
         for i in 1..V1.Pointer loop
            tmp := False;
            for j in 1..V2.Pointer loop
               if V1.Data(i) = V2.Data(j) then
                  tmp := true;
               end if;
            end loop;
            if tmp = False then
               return False;
            end if;

         end loop;

      end if;

         return is_true;
   end compare;

   procedure copy(V: in out Vector; arr: TArray) is
      size : Integer;
   begin
      size := arr'Length;
      if(size + V.Pointer <= V.Max) then
         for i in arr'Range loop
            insert(V,arr(i));
         end loop;
      else
         raise Full_Vector;
      end if;

   end copy;

   procedure clear(V: in out Vector) is
   begin
      for i in V.Data'Range loop
         V.Data(i) := 0;
      end loop;

      V.Pointer:= 0;
   end clear;

   procedure print_Vector(V: in Vector) is
   begin
      Ada.Text_IO.Put("<");
      for i in 1..V.Pointer loop
         Ada.Text_IO.Put(Integer'Image(V.Data(i)) &" ");
      end loop;
      Ada.Text_IO.Put_Line(">");
   end print_Vector;



























end Vector_package;
