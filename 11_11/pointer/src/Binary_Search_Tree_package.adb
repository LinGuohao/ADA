with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
package body Binary_Search_Tree_package is
  function Make_root (E:Elem) return BSTree is
      t : BSTree ;
   begin
      t := new Node'(E,null,null);
      return t;
   end Make_root;


   procedure Insert (E: Elem; T: in out BSTree) is
      begin
      if(T = null) then
         --Put(1);
         T := Make_root (E);
         T.LeftT := null;
         T.RightT := null;
      else
      if (T.d < E) then
         Insert(E,T.RightT);
      elsif(E< T.d) then
         Insert(E,T.LeftT);
      end if;
      end if;
   end Insert;


   function Make_Tree (A: TArray) return BSTree is
      t : BSTree;
   begin
      for i in A'Range loop
         Insert(A(i),t);
      end loop;

      return t;
   end Make_Tree;


   procedure getL(T:in BSTree; L: in out Integer) is
   begin
      if(T = null) then
         return;
      end if;
      getL(T.LeftT,L);
      getL(T.RightT,L);
      L:=L+1;
   end getL;

   procedure Push (E:in Elem ; A:in out TArray;index :in out Positive) is
   begin
      A(index) := E;
      index:= index +1;
   end Push;

   procedure realPreOrder(T:in BSTree; A : in out TArray;index :in out Positive) is
   begin
      if(T = null) then
           return ;
      end if;
      Push(T.d,A,index);
      realPreOrder(T.LeftT,A,index);
      realPreOrder(T.RightT,A,index);
   end realPreOrder;



   function PreOrder (T: BSTree) return TArray is
        L:Integer:= 0;
   begin
      getL(T,L);
      declare
         A:TArray(1..L);
         index : Positive := 1;
      begin

         realPreOrder(T,A,index);
         return A;
      end;
   end PreOrder;

   procedure realInOrder(T: in BSTree; A: in out TArray;index :in out Positive) is
   begin
      if(T = null) then
         return ;
      end if;
      realInOrder(T.LeftT,A,index);
      Push(T.d,A,index);
      realInOrder(T.RightT,A,index);
   end realInOrder;




   function InOrder (T: BSTree) return TArray is
        L:Integer:= 0;
   begin
      getL(T,L);
      declare
         A:TArray(1..L);
         index : Positive := 1;
      begin

         realInOrder(T,A,index);
         return A;
      end;
   end InOrder;


   procedure realPostOrder(T:in BSTree ; A : in out TArray;index:in out Positive) is
      --tmp: TArray(1..A'Length+1);
   begin
      if(T = null) then
         return;
      end if;
      realPostOrder(T.LeftT,A,index);
      realPostOrder(T.RightT,A,index);
      Push(T.d,A,index);
   end realPostOrder;






   function PostOrder (T: BSTree) return TArray is
      L:Integer:= 0;
   begin
      getL(T,L);
      declare
         A:TArray(1..L);
         index : Positive := 1;
      begin

         realPostOrder(T,A,index);
         return A;
      end;

   end PostOrder;






end Binary_Search_Tree_package;



