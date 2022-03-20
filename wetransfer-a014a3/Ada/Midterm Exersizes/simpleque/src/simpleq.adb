package body simpleq is

   procedure add(Q:in out Queue;elem:Integer) is
   begin
      if not isFull(Q) then
         Q.Pointer:=Q.Pointer+1;
         Q.Data(Q.Pointer):=elem;
      end if;

   end;

   procedure shift(Q: in out Queue) is
   begin
      for i in Integer'Succ(Q.Data'First)..Q.Data'Last loop
         Q.Data(Integer'Pred(i)):=Q.Data(i);
      end loop;

   end shift;



   function pop(Q: in out Queue) return Integer is
      elem:Integer:=Q.Data(1);
   begin
      shift(Q);
      Q.Pointer:=Q.Pointer-1;
      return elem;
   end pop;

   function top (Q:Queue) return Integer is
   begin
      return Q.Data(1);
   end top;

   function isEmpty(Q:Queue) return Boolean is
   begin
      return Q.Pointer=0;
   end isEmpty;

   function isFull(Q:Queue) return Boolean is
   begin
      return Q.Pointer=Q.Max;
   end isFull;

   function Size(Q:Queue) return Integer is
   begin
      return Q.Pointer;
   end Size;



end simpleq;
