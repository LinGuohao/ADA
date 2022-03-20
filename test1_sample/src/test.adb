with Ada.Text_IO;
use Ada.Text_IO;
with PSet;

procedure test is
   type T is array(Character range<>) of Integer;
   type S is array (Integer range<>) of Integer;
   subtype index is  Integer range 1..10;
   package test_set is new PSet(index);
   use test_set;
   Set1 : Set;
   z :index := 1;
begin

   print_Set(Set1);
end test;
