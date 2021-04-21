with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure fourth2 is
   type Index is new Integer;
   type Elem is new Integer;
   type Matrix is array (Index range <>, Index range <>) of Elem;
   type Max is new Integer;
   type Size is new Integer;
   type newarray is array (Integer range <>) of Integer;
   Maxrow: Max;
   Mincol : Max;
   cont : Integer;
   tmp : Integer;
   ctrli : Integer;
   ctrlj : Integer;

   procedure Get_Row_Max(M : in Matrix; RowArray : out newarray) is
   begin
      cont := 1;

      for i in M'Range(1) loop
         Maxrow := Max(M(i,(M'First(2))));
         for j in M'Range(2) loop
            if M(i,j) > Elem( Maxrow) then
               Maxrow := Max(M(i,j));
            end if;
         end loop;
         RowArray(cont) := Integer(Maxrow);
         cont := cont + 1;
      end loop;


   end Get_Row_Max;

   function Get_col_Min(M: Matrix ; i : Index) return Max is
   begin
       cont := 1;
      for j in M'Range(2) loop
         if(i = index(cont)) then
             Mincol := Max(M(M'First(1),j));
            for z in M'Range(1) loop

               if(M(z,j) < Elem(Mincol)) then
                  Mincol:= Max(M(z,j));
               end if;
            end loop;
         end if;


          cont := cont + 1;
         end loop;

      return Mincol;
   end Get_col_Min;



   procedure Local_Maximum (M : in Matrix) is
      Msize : Size;
   begin
      Msize := M'Length(1);
      declare
         RowArray : newarray (1..Integer(Msize));
      begin
         --Put(Integer'Image(RowArray'Length));
         Get_Row_Max(M,RowArray);
         ctrli := 1;

         for i in M'Range(1) loop
            tmp := RowArray(ctrli);
            ctrlj := 1;
            for j in M'Range(2) loop
              -- Put(Integer'Image(ctrlj));
               if M(i,j) = Elem(tmp) then
                  Mincol := Get_col_Min(M,Index(ctrlj));
                  if(tmp = Integer(Mincol)) then
                     Put(Integer'Image(ctrli) & "," & Integer'Image(ctrlj) &"=");
                     Put(Integer'Image(tmp));

                     New_Line;

                  end if;
               end if;
                 ctrlj := ctrlj+1;
            end loop;
            ctrli := ctrli + 1;
         end loop;



         --for i in M'Range(1) loop
           -- cont := 1;
            --for j in M'Range(2) loop
              -- if( cont = 2) then
                --  Put(Integer'Image(Integer(M(i,j))));
               --end if;
               --cont := cont + 1;
            --end loop;
         --end loop;






      end;

   end Local_Maximum;







begin
   Local_Maximum(((11,22,33,44,55),(1,8,3,8,8),(10,10,20,30,1)));






end fourth2;
