generic
   type A is limited private;
   type TA_Array is array ( Integer range <> ) of A;
   Searched : in A;
   with function Op( Z, B: A ) return Boolean;

procedure double2(ta: in TA_Array; is_true : out Boolean ;index1 : out Integer ; index2: out Integer);
