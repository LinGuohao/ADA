with Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body String_Types is


   function getAppIndex(start:Index;n:Natural) return Index is
      i:Index:=start;
   begin
      for j in 1..n loop
         i:=Index'Succ(i);
      end loop;
      return i;
   end getAppIndex;

   function goBack(start:Index;n:Natural) return Index is
         i:Index:=start;
   begin
      for j in 1..n loop
         i:=Index'Pred(i);
      end loop;
      return i;
   end goBack;

   function Init(S : TArray) return String_Type is
      string:String_Type(getAppIndex(Index'First,S'Length-1));
      ind:Index:=string.String'First;
   begin
      for I in S'Range loop
         string.String(ind):=S(I);
         ind:=Index'Succ(ind);

      end loop;
      string.Size:=S'Length;
      return string;
   end Init;

   function Char_At(S : String_Type; i : Index) return Char is
   begin
      return S.String(i);
   end Char_At;

   procedure Compare_To(S1 : String_Type; S2 : String_Type; e: out Enum) is
   begin
      if(S1.Size=S2.Size) then
         for I in S1.String'Range loop
            if not (S1.String(I) = S2.String(I)) then

               if (S1.String(I) < S2.String(I)) then
                  e:=Enum'Val(2);
                  return;
               else

                  e:=Enum'Val(1);
                  return;
               end if;

            end if;
         end loop;
         e:=Enum'Val(0);


      elsif (S1.Size<S2.Size) then
           e:=Enum'Val(2);



      else
         e:=Enum'Val(1);
      end if;

   end Compare_To;

   function "+"(S1 : String_Type; S2 : String_Type) return String_Type is
      rez:String_Type(getAppIndex(Index'First,S1.String'Length+S2.String'Length-1));
      ind:Index:=rez.String'First;
   begin

      --for I in 1..S1.Size loop
      for I in S1.String'Range loop
         rez.String(ind):=S1.String(I);
         ind:=Index'Succ(ind);
      end loop;
      --for J in 1..S2.Size loop
      for J in S2.String'Range loop
         --rez.String(J+S1.Size):=S2.String(J);
         rez.String(ind):=S2.String(J);
         ind:=Index'Succ(ind);
      end loop;
      rez.Size:=S1.Size+S2.Size;

      return rez;
   end "+";

   function equalArr(a:TArray;b:TArray;n:Index) return Boolean is
   begin

      --Put(n);
      for I in a'Range loop
         if not(a(I)= b(I)) then
            return False;
         end if;

      end loop;

      return True;
   end equalArr;

   function equalArr2(a,b:TArray;i:Index) return Boolean is
      ind:Index:=i;
   begin
      for I in b'Range loop
         if not (a(ind)=b(I)) then
            return False;
         end if;
         ind:=Index'Succ(ind);
      end loop;
      return True;


   end equalArr2;



   function Contains(S : String_Type; Sub : String_Type) return Boolean is
      I:Index:=S.String'First;
      L:Boolean:=False;
   begin
      if(S.Size<Sub.Size) then
         return False;
      end if;
      --Put(S.Size);
      while I<S.String'Last and (not L) loop
         --Put(I);
         L:=equalArr2(S.String,Sub.String,I);
         I:=Index'Succ(I);
      end loop;

      return L;

   end Contains;


   function Contains(S : String_Type; Str : TArray) return Boolean is
      st:String_Type(getAppIndex(Index'First,Str'Length-1)):=Init(Str);
   begin
      return Contains(S,st);
   end Contains;





   function Ends_With(S : String_Type; Ending : String_Type) return Boolean is
      ind:Index:=Index'First;
   begin
      if(Ending.Size > S.Size) then
         return False;
      end if;

      for I in getAppIndex(Index'First,S.Size-Ending.Size)..S.String'Last loop
         if not (S.String(I) = Ending.String(ind)) then
            return False;
         end if;
         ind:=Index'Succ(ind);
      end loop;
      return True;

   end Ends_With;




   function Ends_With(S : String_Type; Ending : TArray) return Boolean is
     str:String_Type(getAppIndex(Index'First,Ending'Length-1)):=Init(Ending);
   begin
      return Ends_With(S,str);
   end Ends_With;





   function Index_Of(S : String_Type; C : Char) return Index is
   begin
      for I in S.String'Range loop
         if S.String(I)=C then
            return i;
         end if;
      end loop;
      --return S.Size+1;
      return S.String'Last;
   end Index_Of;

   function Index_Of(S : String_Type; C : Char; I : Index) return Index is
   J :Index:=I;
   begin
      for i in J .. S.String'Last loop
         if S.String(i)=C then
            return i;
         end if;

      end loop;
      --return S.Size+1;
      return S.String'Last;
   end Index_Of;


   function Index_Of(S : String_Type; Str : TArray) return Index is
      I:Index:=S.String'First;
      L:Boolean:=False;
      Sub:String_Type(getAppIndex(Index'First,Str'Length-1)):=Init(Str);
   begin

      while I<S.String'Last and (not L) loop

         L:=equalArr2(S.String,Sub.String,I);
         I:=Index'Succ(I);
      end loop;

      return Index'Pred(I);

   end Index_Of;



   function Last_Index_Of(S : String_Type; Str : TArray) return Index is
      L:Boolean:=False;
      Sub:String_Type(getAppIndex(Index'First,Str'Length-1)):=Init(Str);
      I:Index:=getAppIndex(Index'First,S.Size-Sub.Size+1);
   begin
      --Put(I);
      while I>Index'First and (not L) loop
         L:=equalArr2(S.String,Sub.String,I);
         I:=Index'Pred(I);
      end loop;

      return Index'Succ(I);
   end Last_Index_Of;




   function Last_Index_Of(S : String_Type; C : Char) return Index is
   begin
      for I in reverse S.String'Range loop
         if S.String(I)=C then
            return I;
         end if;
      end loop;
      return S.String'Last;
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

      for I in Ending.String'Range loop
         if not( S.String(I) = Ending.String(I)) then
            return False;
         end if;
      end loop;
      return True;
   end Starts_With;

   function Starts_With(S : String_Type; Ending : TArray) return Boolean is
      str:String_Type(getAppIndex(Index'First,Ending'Length-1)):=Init(Ending);
   begin
      return Starts_With(S,str);
   end Starts_With;




   procedure Replace(S : in out String_Type; Cold : Char; Cnew : Char) is
   begin
      for I in S.String'Range loop
         if S.String(I)=Cold then
            S.String(I):=Cnew;
         end if;

      end loop;

   end;


   function findDiff(a,b:Index) return Natural is
      n:Natural:=0;
   begin
      for I in a..b loop
         n:=n+1;
      end loop;

      return n;
   end findDiff;





   function createString(a:TArray;Starts : Index;Ending:Index) return TArray is
      --str:Unbounded_String:=To_Unbounded_String("");
      str:TArray(Index'First..getAppIndex(Index'First,findDiff(Starts,Ending)-1));
      ind:Index:=Index'First;
   begin

      for I in Starts..Ending loop
         str(ind):=a(i);
         ind:=Index'Succ(ind);
      end loop;
      return str;
   end createString;


   function Substring(S : String_Type; Starts : Index) return String_Type is
      size:Index:=getAppIndex(Index'First,findDiff(Starts,S.String'Last));
       final:String_Type(size):=Init(createString(S.String,Index'Pred(Starts),S.String'Last));
   begin

      return final;

   end Substring;

   function SubString(S : String_Type; Starts : Index; Ends : Index) return String_Type is
          final:String_Type(getAppIndex(Index'First,findDiff(Starts,Ends)-1)):=Init(createString(S.String,Index'Pred(Starts),Index'Pred(Ends)));
   begin

      return final;

   end Substring;

   function position(n:Index) return Integer is
      ind:Index:=Index'First;
      pos:Integer:=1;
   begin
      while ind<n loop
         pos:=pos+1;
         ind:=Index'Succ(ind);
      end loop;
      return pos;
   end position;



   function toString(S:String_Type) return TArray is
      arr:TArray(Index'First..getAppIndex(Index'First,S.Size));
      ind:Index:=Index'First;
   begin
      if(S.Size>=1) then
         --Put(position(getAppIndex(Index'First,S.Size-1)));
         for I in  Index'First..getAppIndex(Index'First,S.Size-1) loop
            arr(ind):=S.String(i);
            ind:=Index'Succ(ind);
         end loop;

      end if;
      return arr;
   end toString;


   function createStringS(a:TArray;Starts : Index;Ending:Index;length: out Natural) return TArray is
      --str:Unbounded_String:=To_Unbounded_String("");
      str:TArray(Index'First..getAppIndex(Index'First,findDiff(Starts,Ending)-1));
      ind:Index:=Index'First;
   begin
      length:=findDiff(Starts,Ending)-1;

      for I in Starts..Ending loop

         str(ind):=a(i);
         ind:=Index'Succ(ind);
      end loop;
      return str;
   end createStringS;


   function InitSpecial(S : TArray;length: Natural) return String_Type is
         string:String_Type((getAppIndex(Index'First,42)));
      --i: Integer:=0;
      ind:Index:=string.String'First;
   begin
      string.Size:=length;
         for I in S'Range loop
            -- i:=i+1;
         string.String(ind):=S(I);
         ind:=Index'Succ(ind);

      end loop;
      --string.String(ind):=null;
         string.Size:=S'Length;
         return string;
   end InitSpecial;


   function splitAux(S : String_Type; Starts : Index; Ends : Index) return String_Type is
      length:Natural;

      final:String_Type((getAppIndex(Index'First,42))):=InitSpecial(createStringS(S.String,Starts,Ends,length),length);
   begin

      return final;
   end splitAux;


   function createEmpty(n:Natural) return String_Type is
       string:String_Type((getAppIndex(Index'First,42)));
   begin
      string.Size:=n;
         return string;
   end createEmpty;



function Split(S : String_Type; Delim : Char) return String_Type_Array is
      arr: String_Type_Array(S.String'Range):=(others=>createEmpty(0));
      I:Index:=S.String'First;
      J:Index:=S.String'First;
      ind:Index:=Index'First;

   begin

      while I<=S.String'Last loop

         if(S.String(I)=Delim) then
            arr(ind):=splitAux(S,J,Index'Pred(I));
            J:=Index'Succ(I);
            ind:=Index'Succ(ind);
         end if;
         I:=Index'Succ(I);
      end loop;
      return arr;
   end Split;


end String_Types;
