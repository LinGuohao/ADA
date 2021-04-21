with Ada.Integer_Text_IO;
procedure quiz is
   begin
     for i in 1 .. 10 loop
     case i is
     when 1 | 3 | 5 => Put("Odd ");
when 2 | 4 => Put("Even ");
end case;
end loop;
end quiz;
