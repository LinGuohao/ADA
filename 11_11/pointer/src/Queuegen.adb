package body Queuegen is
   procedure Push(Q:in out Queue; E: in Element) is
   tmp : Node_Pointer;
   begin
      if(Q.Top = null) then
         Q.Top := new Node'(E,null);
         Q.Size := Q.Size + 1;
      elsif (Q.Size = 1) then
         Q.Top.Next := new Node'(E,null);
         Q.Size := Q.Size + 1;
      else
         tmp:= Q.Top.Next;
         for i in 3..Q.Size loop
            tmp := tmp.Next;
         end loop;
         tmp := new Node'(E,null);
         Q.Size := Q.Size + 1;
      end if;

      end Push;



   procedure Pop(Q : in out Queue; E: out Element) is
   begin
      if(Q.Top = null) then
         raise Empty_Queue;
      else
         E := Q.Top.E;
         Q.Top := Q.Top.Next;
         Q.Size := Q.Size -1;
      end if;
   end Pop;

   function IsEmpty(Q:Queue) return Boolean is
   begin
      return Q.Size = 0;
   end IsEmpty;

   function Top(Q:Queue) return Element is
   begin
      return Q.Top.E;
      Exception when Constraint_Error => raise Empty_Queue;
   end Top;

   function Size (Q:Queue) return Natural is
   begin
      return Q.Size;
   end Size;


end Queuegen;
