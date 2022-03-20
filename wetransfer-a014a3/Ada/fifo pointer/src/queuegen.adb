package body Queuegen is

 procedure Push( V: in out Queue; E: in Elem ) is
      begin
          V.Top := new Node'(E,V.Top);
          V.Size := V.Size + 1;
      end;

      procedure Pop( V: in out Queue; E: out Elem ) is
      begin
          E := Top(V);
          V.Top := V.Top.Next;
          V.Size := V.Size - 1;
      end;

      function Top( V: Queue ) return Elem is
      begin
          return V.Top.Data;
      exception
          when Constraint_Error => raise Empty_Stack;
      end;

      function Is_Empty( V: Queue ) return Boolean is
      begin
          return V.Size = 0;
      end;

      function Is_Full( V: Queue ) return Boolean is
      begin
          return False;
      end;

      function Size( V: Queue ) return Natural is
      begin
          return V.Size;
      end;
end Stacksgen;
