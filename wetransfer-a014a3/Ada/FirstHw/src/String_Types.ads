
package String_Types is


   --type String_Type(Max: Positive := 10) is limited  private;
   -- ^^this fixes fixes the array problem but causes storage exception
   type String_Type(Max: Positive) is limited  private;
   --type StringPtr is access all String_Type;
   type String_Type_Array is array( Natural range <> ) of String_Type(42);
   --type String_Type_Array is array( Integer range <> ) of String_Type(50);
   --^^ this works but dont know how to print



   --procedure Print(S:String_Type);
   function Init(S : String) return String_Type; -- initializes, it is like a constructor.
   function Char_At(S : String_Type; i : Positive) return Character;
   function Compare_To(S1 : String_Type; S2 : String_Type) return Boolean;
   function "+"(S1 : String_Type; S2 : String_Type) return String_Type;  -- concatenates
   function Contains(S : String_Type; Sub : String_Type) return Boolean;
   function Contains(S : String_Type; Str : String) return Boolean;
   function Ends_With(S : String_Type; Ending : String_Type) return Boolean;
   function Ends_With(S : String_Type; Ending : String) return Boolean;
   function Index_Of(S : String_Type; C : Character) return Positive; -- finds the first occurance
   function Index_Of(S : String_Type; C : Character; I : Positive) return Positive;  -- searches from I-th character
   function Index_Of(S : String_Type; Str : String) return Positive;  -- searches substring!
   function Last_Index_Of(S : String_Type; C : Character) return Positive;
   function Last_Index_Of(S : String_Type; Str : String) return Positive;
   function Length(S : String_Type) return Natural;
   procedure Replace(S : in out String_Type; Cold : Character; Cnew : Character);
   function Split(S : String_Type; Delim : Character) return String_Type_Array;
   function Starts_With(S : String_Type; Ending : String_Type) return Boolean;
   function Starts_With(S : String_Type; Ending : String) return Boolean;
   function Substring(S : String_Type; Starts : Positive) return String_Type;
   function SubString(S : String_Type; Starts : Positive; Ends : Positive) return String_Type;
   function toString(S:String_Type) return String;

private
   type TArray is array( Integer range <> ) of Character;
   --type String_Type(Max :Positive :=10) is record
   type String_Type(Max :Positive) is record
      Size : Natural;
      String : TArray(1..Max);
   end record;
   --^^one idea is to make the entire representation with pointers but i have to change my entire code
   --im just asking is it a good idea to make everything pointers?


end String_Types;
