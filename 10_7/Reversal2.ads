generic
    type A is limited private;
    type TA_Array is array ( Integer range <> ) of A;
    with procedure Swap(x: in out A ; y : in out A);
procedure Reversal2(ta: in out TA_Array);
