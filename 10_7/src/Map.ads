generic
    type A is private;
    type B is private;
    type TA_Array is array ( Integer range <> ) of A;
    type TB_Array is array ( Integer range <> ) of B;
    with function Op(x: A) return B;
function Map(ta: TA_Array) return TB_Array;
