with more,map,reversal,Ada.Float_Text_IO,Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Float_Text_IO,Ada.Text_IO;
procedure Main is
   type arr is array (Integer range <>) of Integer;

   type brr is array (Integer range <>) of Float;


   function half(a:Integer) return Float is
   begin
      return Float(a)/2.0;
   end half;

   procedure Print(b:brr) is
   begin
      for i in b'Range loop
         Put(b(i));
      end loop;

   end Print;
   procedure Print1(b:arr) is
   begin
      for i in b'Range loop
         Ada.Integer_Text_IO.Put(b(i));
      end loop;

   end Print1;

   procedure swap(a,b:in out Integer) is
      n:Integer:=a;
   begin
      a:=b;
      b:=n;
   end swap;



   function mymap is new Map(Integer,Integer,Float,arr,brr,half);
   procedure rev is new reversal(Integer,Integer,arr,swap);
   procedure m is new more(Integer,Integer,arr,"=");

   a:arr(1..4):=(1,2,3,2);
   b:brr(a'Range);
   i,j:Integer;
   l:Boolean;
begin
   b:=mymap(a);
   Print(b);
   New_Line;
   Print1(a);
   New_Line;
   rev(a);
   Print1(a);
   m(a,l,i,j);
   New_Line;
   Put(Boolean'Image(l));
   Ada.Integer_Text_IO.Put(i);
   Ada.Integer_Text_IO.Put(j);
   Ada.Integer_Text_IO.Put(a(j));

end Main;
