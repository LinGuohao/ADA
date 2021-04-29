with Ada.Text_IO;
procedure test1 (Element : in Positive) is
   V : Positive;
   testException : Exception;
begin
   V := Element;
exception
   when CONSTRAINT_ERROR =>
     raise testException;
end test1;
