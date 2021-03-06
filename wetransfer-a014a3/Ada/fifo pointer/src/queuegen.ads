generic
      type Elem is private;
package Queuegen is

      type Queue  is limited private;

      Empty_Stack : Exception;
      procedure Push( V: in out Queue; E: in Elem );
      procedure Pop( V: in out Queue; E: out Elem );
      function Top( V: Queue ) return Elem;
      function Is_Empty( V: Queue ) return Boolean;
      function Is_Full( V: Queue ) return Boolean;
      function Size( V: Queue ) return Natural;

private
    type Node;
      type Pointer is access Node;
      type Node is record
                      Data: Elem;
                      Next: Pointer := null;
                    end record;
      type Stack is record
                       Size: Natural := 0;
                       Top: Pointer := null;
                    end record;
end Queuegen;
