with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;


procedure third  is
   type Index is new Integer;
   type Elem is new Integer;
   type Matrix is array (Index range <>, Index range <>) of Elem;
   num : Integer:=1;
   cont : Integer :=0;
   conti:Integer := 1;
   contj: Integer := 1;
   tmp : Integer;
   tmpi:Integer;
   tmp2 : Integer;
   tmpj : Integer;
   procedure diagonal (M : in out Matrix ) is

   begin
      for i in  M'Range(1) loop
         cont := cont + 1;
      end loop;
      --  Ada.Integer_Text_IO.Put(cont);
      tmp := Integer'Succ(Integer(M'First(1)));
      tmp2 := Integer'Succ(Integer(M'First(2)));
      while cont /= 0 loop
         if(num = 1) then
          Put(Elem'Image(M(M'First(1),M'First(2))));
         end if;
         if(num = 2) then

          Put(Elem'Image(M((Index'Succ(M'First(1))),Index'Succ(M'First(2)))));

         end if;

         if(num > 2) then

            tmpi := Integer'Succ(tmp);
            tmp:= tmpi;
            tmpj := Integer'Succ(tmp2);
            tmp2 := tmpj;

           Put(Elem'Image ( M((index(tmpi)),(index(tmpj)))));


         end if;





            cont:= cont -1;
            num := num + 1;
      end loop;



   end diagonal;

   M: Matrix := ((1,2,3,7),(1,2,3,8),(3,2,3,9),(2,3,5,6));
begin
   diagonal(M);
end third;
