with Ada.Text_IO,Bags;use Ada.Text_IO;
procedure Main is
   package MyBag is new Bags(Character);
   use MyBag;
   S : String :="Of course I will get mark 5!";
   A:Bag;
   Result: Integer;
   --index : Character;
begin
   for i in S'Range loop
      Add(A,S(i));
   end loop;
   Result:=0;
   Result := (Multiplicity(A,'O'))+(Multiplicity(A,'f'))+
             (Multiplicity(A,' ')) + (Multiplicity(A,'o'))+
                (Multiplicity(A,'u')) + (Multiplicity(A,'r'))+
              (Multiplicity(A,'s')) + (Multiplicity(A,'e')) +
               (Multiplicity(A,'I')) + (Multiplicity(A,'w'))+
              (Multiplicity(A,'l')) + (Multiplicity(A,'g'))+
                (Multiplicity(A,'t')) + (Multiplicity(A,'c')) +
              (Multiplicity(A,'m')) + (Multiplicity(A,'a'))+
               (Multiplicity(A,'k')) + (Multiplicity(A,'5'))+
                     (Multiplicity(A,'!'));

    Remove_Duplicates(A);
   Put_Line(Natural'Image(Result));
     Remove_Duplicates(A);






end Main;
