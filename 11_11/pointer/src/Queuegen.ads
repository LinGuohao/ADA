generic
   type Element is private;
package Queuegen is
   type Queue is limited private;
   Empty_Queue : Exception;
   procedure Push(Q:in out Queue; E: in Element);
   procedure Pop(Q : in out Queue; E: out Element);
   function IsEmpty(Q:Queue) return Boolean;
   function Top(Q:Queue) return Element;
   function Size (Q:Queue) return Natural;
private
   type Node;
   type Node_Pointer is access Node;
   type Node is record
      E:Element;
      Next : Node_Pointer;
   end record;

   type Queue is record
      Size : Natural :=0;
      Top: Node_Pointer := null;
   end record;
end Queuegen;
