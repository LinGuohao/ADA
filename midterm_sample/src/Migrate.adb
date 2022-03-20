procedure Migrate (G:in out Grid ; Max:in Natural) is
   type Copy is array(Integer range<>,Integer range<>) of Natural;
   length1 : Integer;
   length2 : Integer;
   cont1: Integer;
   cont2: Integer;
begin

      length1 := G'Length(1);
      length2 := G'Length(2);
   declare
      tmpGrid : Copy(1..length1,1..length2);

   begin
      --copy
      cont1:=1;
      for i in G'Range(1) loop
         cont2:=1;
         for j in G'Range(2) loop
            tmpGrid(cont1,cont2) := G(i,j);
            cont2 := cont2 + 1;
         end loop;
         cont1:= cont1+1;
      end loop;

      for i in tmpGrid'Range(1) loop
         for j in tmpGrid'Range(2) loop
            if(tmpGrid(i,j)> Max) then
               if(i-1 >= 1) then
                  --Ada.Text_IO.Put_Line(Natural'Image(tmpGrid(i-1,j)));
                  --Ada.Text_IO.Put_Line(Natural'Image(tmpGrid(i,j)));
                  if(tmpGrid(i-1,j) <= Max) then
                     tmpGrid(i-1,j) := Max;
                     tmpGrid(i,j):= tmpGrid(i,j) - Max;
                  end if;

               elsif(i+1 <= length1) then
                  if(tmpGrid(i+1,j)  <= Max) then
                     tmpGrid(i+1,j) := Max;
                     tmpGrid(i,j):= tmpGrid(i,j) - Max;
                  end if;


               elsif(j-1>=1) then
                  if(tmpGrid(i,j-1)  <= Max) then
                     tmpGrid(i,j-1) := Max;
                     tmpGrid(i,j):= tmpGrid(i,j) - Max;
                  end if;
               elsif(j+1 <= length2) then
                  if(tmpGrid(i,j+1)  <= Max) then
                     tmpGrid(i,j+1):= Max;
                     tmpGrid(i,j) := tmpGrid(i,j) - Max;
                  end if;

               end if;
            end if;
         end loop;
      end loop;















      -- copy
      cont1:=1;
      for i in G'Range(1) loop
         cont2:=1;
         for j in G'Range(2) loop
            G(i,j):= tmpGrid(cont1,cont2);
            cont2 := cont2 + 1;
         end loop;
         cont1:= cont1+1;
      end loop;








   end;


end Migrate;
