with Ada.Text_IO, Ada.Integer_Text_IO;
package body SBag is
   procedure insert_one(B: in out Bag ; S: Integer) is
   is_found : Boolean;
   begin
      is_found := False;
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            if(B.Data(i).Data = S) then
               B.Data(i).Number := B.Data(i).Number + 1;
               is_found := True;
            end if;
         end loop;
         if is_found = False then
            if B.Pointer < 100 then
               B.Pointer := B.Pointer + 1;
               B.Data(B.Pointer).Data := S;
               B.Data(B.Pointer).Number := 1;
            end if;

         end if;

      end if;
      if is_empty(B) = True then
         B.Pointer := B.Pointer + 1;
         B.Data(B.Pointer).Data := S;
         B.Data(B.Pointer).Number := 1;
      end if;




   end insert_one;


   procedure insert_multiple(B: in out Bag ; S: Integer ; Num:Integer) is
      is_found : Boolean;
   begin
      is_found := False;
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            if(B.Data(i).Data = S) then
               B.Data(i).Number := B.Data(i).Number + Num;
               is_found := True;
            end if;
         end loop;
         if is_found = False then
            if B.Pointer < 100 then
               B.Pointer := B.Pointer + 1;
               B.Data(B.Pointer).Data := S;
               B.Data(B.Pointer).Number := Num;
            end if;

         end if;

      end if;

      if is_empty(B) = True then
         B.Pointer := B.Pointer + 1;
         B.Data(B.Pointer).Data := S;
         B.Data(B.Pointer).Number := Num;
      end if;


   end insert_multiple;


   procedure extract_one(B : in out Bag ; S: in Integer; extracted : out Item)  is
   begin
      extracted.Data := -1;
      extracted.Number := -1;
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            if B.Data(i).Data = S then
               extracted.Data := S;
               extracted.Data := 1;
               B.Data(i).Number := B.Data(i).Number - 1;
            end if;
         end loop;
      end if;


      arrange(B);



   end extract_one;


   procedure extract_multiple(B :in out Bag ; S: in Integer ; Num:in Integer; extracted: in out Item) is
   begin
      extracted.Data := -1;
      extracted.Number := -1;
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            if B.Data(i).Data = S then
               if B.Data(i).Number>= Num then
                  extracted.Data := S;
                  extracted.Number := Num;
                  B.Data(i).Number := B.Data(i).Number - Num;
               end if;
            end if;

         end loop;

      end if;

      arrange(B);


   end extract_multiple;


   function is_empty(B:Bag) return Boolean is
   begin
      return B.Pointer = 0;
   end is_empty;

   procedure arrange(B: in out Bag) is
      cont : Integer;
      tmparray : newarray(1..B.Pointer);
   begin
      cont:= 1;
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            if B.Data(i).Number /= 0 then
               tmparray(cont).Data := B.Data(i).Data;
               tmparray(cont).Number := B.Data(i).Number;
               cont:= cont+1;
            end if;
         end loop;
         B.Pointer := cont-1;
         cont:= 1;
         for i in 1..B.Pointer loop

            B.Data(cont).Data := tmparray(i).Data;
            B.Data(cont).Number := tmparray(i).Number;
            cont := cont + 1;
         end loop;


      end if;



   end arrange;

   procedure print(B:in Bag) is
   begin
      if is_empty(B) /= True then
         for i in 1..B.Pointer loop
            Ada.Text_IO.Put("<" & Integer'Image(B.Data(i).Data) &"," & Integer'Image(B.Data(i).Number)&">");
         end loop;
      end if;

   end print;

   procedure print (E: in Item) is
   begin
   Ada.Text_IO.Put("<" & Integer'Image(E.Data) &"," & Integer'Image(E.Number)&">");
   end print;







end SBag;
