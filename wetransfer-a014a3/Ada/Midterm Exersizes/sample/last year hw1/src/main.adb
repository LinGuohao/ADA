with PBag,Ada.Integer_Text_IO,Ada.Text_IO;
procedure Main is

   package mybag is new PBag(Integer);
   use mybag;



   b:Bag(20);
   procedure Print(e: in out Integer) is
    begin
        Ada.Integer_Text_IO.Put(e);
        Ada.Text_IO.Put(" With Multiplicity ");
        Ada.Integer_Text_IO.Put(MyBag.Multiplicity(b,e));
        Ada.Text_IO.New_Line;
    end Print;


   procedure pri is new For_Each(Print);




begin
   Add(b,1);
   Add(b,1);
   Add(b,1);
   Add(b,1);
   Add(b,3);
   Add(b,6);
   Add(b,6);
   pri(b);
   Ada.Integer_Text_IO.Put(MyBag.Multiplicity(b, 1));
   Ada.Text_IO.New_Line;
   Remove(b,1);
   pri(b);
   Remove(b,3);
   Ada.Text_IO.New_Line;
   Ada.Text_IO.New_Line;
   pri(b);

end Main;
