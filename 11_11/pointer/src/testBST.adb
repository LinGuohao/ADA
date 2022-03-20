with Binary_Search_Tree_package,Ada.Integer_Text_IO,Ada.Text_IO;use Ada.Integer_Text_IO,Ada.Text_IO;

procedure testBST is
   package Tree is new Binary_Search_Tree_package(Integer);
   use Tree;
   T1: BSTree;
   A1: TArray(1..10):=(5,2,1,3,2,5,1,7,-1,10);
   Result : TArray(1..7);
begin
   --Put(1);
   T1:=Make_Tree(A1);
   --Put(1);

   Result := PostOrder(T1);
   for i in Result'Range loop
      Put(Result(i));
   end loop;
   New_Line;
   Result := PreOrder(T1);
   for i in Result'Range loop
      Put(Result(i));
   end loop;
   New_Line;
   Result := InOrder(T1);
   for i in Result'Range loop
      Put(Result(i));
   end loop;
   New_Line;


end testBST;
