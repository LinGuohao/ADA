generic
   type priority is (<>);
   type data is private;
   with function "<" (Q1:priority;Q2:priority) return Boolean is <>;
package pqueue_type is
   type PQueue(Max:Integer:=100) is private;



   procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data );
   procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean );
   procedure print (PQ : in PQueue);
private
  type pair is record
      num: priority;
      content : data;
   end record;
   type Tarray is array(Integer range<>) of pair;
   type  PQueue(Max:Integer:=100) is record
      parray: Tarray(1..Max);
      Pointer: Integer:=0;

   end record;

end PQueue_type;
