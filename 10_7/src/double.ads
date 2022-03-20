generic
   type A is private;
   type TA_Array is array ( Integer range <> ) of A;
   Searched : in A;
procedure double(ta: in TA_Array; is_true : out Boolean ;index1 : out Integer ; index2: out Integer);
