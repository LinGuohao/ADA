with pqueue_type;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
procedure demo is
   package test is new pqueue_type(Integer,Integer);
   use test;
   Q1: PQueue(4);
begin
   test.Insert(Q1,1,2);
   test.Insert(Q1,2,4);
   test.Insert(Q1,2,10);
   test.Insert(Q1,1,10);
   test.Insert(Q1,1,10);
  test.print(Q1);
end demo;
