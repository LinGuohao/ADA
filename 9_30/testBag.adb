with SBag,Ada.Text_IO;use SBag;
procedure testBag is
   extracted: Item;
   B: Bag;
begin
   insert_one(B,5);
   print(B);
   Ada.Text_IO.New_Line;
   insert_multiple(B,5,7);
   insert_multiple(B,2,5);
   insert_multiple(B,3,2);
   print(B);
   Ada.Text_IO.New_Line;
   extract_one(B,2,extracted);
   extract_multiple(B,3,2,extracted);
   print(B);
   Ada.Text_IO.New_Line;
   print(extracted);








end testBag;
