with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure second is
   temp : Integer := 0;
   type swapped is new Boolean;
   type number is new Integer;
   type newarray is array (Integer range <>) of Integer;



   procedure BubbleSort (T:in out newarray) is
      toswapp: swapped ;
      temp :number;
      temp2 : number;
   begin
      declare
         N : newarray(0..Integer(T'Length) - 1);
      begin
          temp2:=0;
          for i in T'Range loop
            N(Integer(temp2)) := T(i) ;

            temp2 := temp2 + 1;
          end loop;


            for i in 0..N'Length-1 loop
               toswapp := False;

            for j in 0..N'Length - 2 - i loop
               --Put_Line(Integer'Image(Integer(i)));
                  if((N(Integer(j))) > Integer(N(Integer(j+1)))) then
                     temp := number(N(Integer(j)));
                     N(Integer(j)):= N(Integer(j+1));
                     N(Integer(j+1)):= Integer(temp);
                     if (toswapp /= True) then
                        toswapp := True;
                     end if;


                  end if;

               end loop;

            if (toswapp = False) then
               temp2:=0;
                for i in T'Range loop
                  T(i) := N(integer(temp2));
                  --Put_Line(Integer'Image(T(i)));
                  temp2 := temp2 + 1;
               end loop;
                  return;
             end if;


            end loop;




      end;

      end  BubbleSort;

      T:newarray:=(3,6,1,5,9);
begin

   BubbleSort(T);
   for I in T'Range loop
       Put_Line( Integer'Image( T(I) ) );
    end loop;

   end second;
