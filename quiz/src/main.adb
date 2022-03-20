with Ada.Text_IO,test;use Ada.Text_IO;
procedure main is
subtype Short is Integer range -128..127;

   S: Short := 1;
   N: Integer := -2;

begin
   S := N;
   N := S;
end main;
