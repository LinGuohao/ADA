generic
   type Char is (<>);
   type Index is range <>;
   with function "=" (a:Char;b:Char )return Boolean is <>;

package String_Types is



   type String_Type(Max: Index) is limited private;
   type TArray is array( Index range <> ) of Char;


   --function getAppIndex(start:Index;n:Natural) return Index;
   --type String_Type_Array is array( Index range <> ) of String_Type(41);--String_Type((getAppIndex(Index'First,42)));
   type String_Type_Array is array( Index range <> ) of String_Type(-2147483606);
   --^^ the red number is index we get if we start from Index'First and we move fro 42 places :D



   function Init(S : TArray) return String_Type; -- initializes, it is like a constructor.
   function Char_At(S : String_Type; i : Index) return Char;
   --function Compare_To(S1 : String_Type; S2 : String_Type) return Boolean;
   function "+"(S1 : String_Type; S2 : String_Type) return String_Type;  -- concatenates
   function Contains(S : String_Type; Sub : String_Type) return Boolean;
   function Contains(S : String_Type; Str : TArray) return Boolean;
   function Ends_With(S : String_Type; Ending : String_Type) return Boolean;
   function Ends_With(S : String_Type; Ending : TArray) return Boolean;
   function Index_Of(S : String_Type; C : Char) return Index; -- finds the first occurance
   function Index_Of(S : String_Type; C : Char; I : Index) return Index;  -- searches from I-th character
   function Index_Of(S : String_Type; Str : TArray) return Index;  -- searches substring!
   function Last_Index_Of(S : String_Type; C : Char) return Index;
   function Last_Index_Of(S : String_Type; Str : TArray) return Index;
   function Length(S : String_Type) return Natural;
   procedure Replace(S : in out String_Type; Cold : Char; Cnew : Char);
   function Split(S : String_Type; Delim : Char) return String_Type_Array;
   function Starts_With(S : String_Type; Ending : String_Type) return Boolean;
   function Starts_With(S : String_Type; Ending : TArray) return Boolean;
   function Substring(S : String_Type; Starts : Index) return String_Type;
   function SubString(S : String_Type; Starts : Index; Ends : Index) return String_Type;
   function toString(S:String_Type) return TArray;

   generic
      type Enum is (<>);
   procedure Compare_To(S1 : String_Type; S2 : String_Type; e: out Enum);

private


   type String_Type(Max :Index) is record
      Size : Natural;
      String : TArray(Index'First..Max);
      --String : TArray(Min..Max);
   end record;


end String_Types;
