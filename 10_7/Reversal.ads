generic
    type A is private;
    type TA_Array is array ( Integer range <> ) of A;
    type TB_Array is array ( Integer range <> ) of A;
    --with function Op(x: A) return B;
function Reversal(ta: TA_Array) return TB_Array;



