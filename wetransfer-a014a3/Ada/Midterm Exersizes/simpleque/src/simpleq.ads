package simpleq is

   type Queue(Max:Natural) is private;
   
   procedure add(Q:in out Queue;elem:Integer);
   function pop(Q: in out Queue) return Integer;
   function top (Q:Queue) return Integer;
   function isEmpty(Q:Queue) return Boolean;
   function isFull(Q:Queue) return Boolean;
   function Size(Q:Queue) return Integer;
   
   
private
   
   type TArray is array(Integer range <>) of Integer;
   
   type Queue(Max:Natural) is record 
      Data:TArray(1..Max);
      Pointer:Natural:=0;
      --Size:Natural;
      end record;

end simpleq;
