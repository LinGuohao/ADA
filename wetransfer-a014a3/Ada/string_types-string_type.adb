with Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body String_Types is
package body String_Type is


   procedure Print(S:String_Type) is
   begin
      for I in 1..S.Size loop
         Put(S.String(I));
      end loop;
      Put_Line("");
   end Print;


   function Init(S : String) return String_Type is
      string:String_Type(50);
      --i: Integer:=0;
   begin
      for I in S'Range loop
        -- i:=i+1;
         string.String(I):=S(I);

      end loop;
      string.Size:=S'Length;
      return string;
   end Init;

   function Char_At(S : String_Type; i : Positive) return Character is
   begin
      return S.String(i);
   end Char_At;

   function Compare_To(S1 : String_Type; S2 : String_Type) return Boolean is
   begin
      if(S1.Size=S2.Size) then
         for I in S1.String'Range loop
            if S1.String(I)/= S2.String(I) then
               return False;
            end if;
         end loop;
         return True;
      else
         return False;

      end if;

   end Compare_To;

   function "+"(S1 : String_Type; S2 : String_Type) return String_Type is
      rez:String_Type(50);
      --i:Integer:=1;
   begin
      --Put(S1.Size);
      --Print(S1);

      --Put(S2.Size);
      --Print(S2);
      for I in 1..S1.Size loop
         rez.String(I):=S1.String(I);
         --i:=i+1;
      end loop;
      for J in 1..S2.Size loop
         --Put(J+S1.Size);
         rez.String(J+S1.Size):=S2.String(J);
         --i:=i+1;
      end loop;
      rez.Size:=S1.Size+S2.Size;

      return rez;
   end "+";

   function equalArr(a:TArray;b:TArray;n:Positive) return Boolean is
   begin

      Put(n);
      for I in 1..n loop
         Put(I);
         Put(a(I));
         Put(b(I));
         Put_Line("");
         if a(I)/= b(I) then
            return False;
         end if;

      end loop;

      return True;
   end equalArr;


   function Contains(S : String_Type; Sub : String_Type) return Boolean is
      I:Integer:=1;
      L:Boolean:=False;
   begin
      if(S.Size<Sub.Size) then
         return False;
      end if;

      while I<S.Size-Sub.Size and (not L) loop
         Put(I);
         Put(S.Size-Sub.Size);
         L:=equalArr(S.String(I..I+Sub.Size-1),Sub.String,Sub.Size);
         I:=I+1;
      end loop;

      return L;

   end Contains;



   function Ends_With(S : String_Type; Ending : String_Type) return Boolean is
   begin
      if(Ending.Size > S.Size) then
         return False;
      end if;
      --Put();
      for I in (S.Size-Ending.Size+1)..S.Size loop
         if S.String(I) /= Ending.String(Ending.Size-(S.Size-I)) then
            return False;
         end if;
      end loop;
      return True;

   end Ends_With;

   function Ends_With(S : String_Type; Ending : String) return Boolean is
     str:String_Type(50):=Init(Ending);
   begin
      return Ends_With(S,str);
   end Ends_With;





   function Index_Of(S : String_Type; C : Character) return Positive is
   begin
      for I in 1..S.Size loop
         if S.String(I)=C then
            return i;
         end if;
      end loop;
      return S.Size+1;
   end Index_Of;

   function Index_Of(S : String_Type; C : Character; I : Positive) return Positive is
   J :Integer:=I;
   begin
      for i in J .. S.Size loop
         if S.String(i)=C then
            return i;
         end if;

      end loop;
      return S.Size+1;
   end Index_Of;


   function Last_Index_Of(S : String_Type; C : Character) return Positive is
   begin
      for I in reverse 1..S.Size loop
         if S.String(I)=C then
            return i;
         end if;
      end loop;
      return S.Size+1;
   end Last_Index_Of;




   function Length(S : String_Type) return Natural is
   begin
      return S.Size;
   end Length;


   function Starts_With(S : String_Type; Ending : String_Type) return Boolean is
   begin
      if(Ending.Size > S.Size) then
         return False;
      end if;

      for I in 1..Ending.Size loop
         if S.String(I) /= Ending.String(I) then
            return False;
         end if;
      end loop;
      return True;
   end Starts_With;

   function Starts_With(S : String_Type; Ending : String) return Boolean is
      str:String_Type(50):=Init(Ending);
   begin
      return Starts_With(S,str);
   end Starts_With;




   procedure Replace(S : in out String_Type; Cold : Character; Cnew : Character) is
   begin
      for I in 1..S.Size loop
         if S.String(I)=Cold then
            S.String(I):=Cnew;
         end if;

      end loop;

   end;


   function Split(S : String_Type; Delim : Character) return String_Type_Array is
      arr:String_Type_Array(1..S.Size);
   begin
      return arr;
   end Split;




   function createString(a:TArray;Starts : Positive;Ending:Positive) return String is
      str:Unbounded_String:=To_Unbounded_String("");
   begin
      for I in Starts..Ending loop
         str:=str & a(i);
      end loop;
      return To_String(str);

   end createString;


   function Substring(S : String_Type; Starts : Positive) return String_Type is
       final:String_Type(50):=Init(createString(S.String,Starts,S.Size));
   begin

      return final;

   end Substring;

   function SubString(S : String_Type; Starts : Positive; Ends : Positive) return String_Type is
          final:String_Type(50):=Init(createString(S.String,Starts,Ends));
   begin

      return final;

   end Substring;




   function toString(S:String_Type) return String is
      str:Unbounded_String:=To_Unbounded_String("");
   begin
      --Put(1);
      for I in 1..S.Size loop
         --Put(S.String(I)'Image);
         str:=str & S.String(i);
      end loop;
      return To_String(str);
   end toString;


end String_Type;
end String_Types;
