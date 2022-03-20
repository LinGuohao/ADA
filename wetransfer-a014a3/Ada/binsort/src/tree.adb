package body Tree is

   function Insert(a:Elem;t:BSTree) return BSTree is
   begin
      if(t=null) then
         return new Node'(a,null,null);
      elsif (a<t.d) then
         Insert(a,t.LeftT);
      else
         Insert(a,t.RightT);
      end if;
   end Insert;

   function Make_Tree (A: TArray) return BSTree is
      t:BSTree:=null;
   begin
      for i in A'Range loop
         insert(A(i),t);
      end loop;

   end Make_Tree;


   function countE(T:BSTree) return Natural is
   begin
      if(T==null) then return 0;
      else
         return 1+countE(t.RightT) + countE(T.LeftT);
   end countE;


   -- root-left-right
   function PreOrder (T: BSTree) return TArray is
         a:TArray(1..countE(BSTree));
         l:TArray;
         r:TArray;
         i:Integer :=1;
   begin
         a(i):=T.d;
         i:=i+1;

        l:=PreOrder(t.LeftT);
         r:=PreOrder(t.RightT);
         for I in l'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;
         for J in r'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;

   return a;
   end PreOrder;

    -- left-root-right
      function InOrder (T: BSTree) return TArray is
         a:TArray(1..countE(BSTree));
         l:TArray;
         r:TArray;
         i:Integer :=1;
      begin

         l:=PreOrder(t.LeftT);
         for I in l'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;

         a(i):=T.d;
         i:=i+1;


         r:=PreOrder(t.RightT);

         for J in r'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;

   return a;
      end InOrder;

      -- left-right-root.
      function PostOrder (T: BSTree) return TArray is
         a:TArray(1..countE(BSTree));
         l:TArray;
         r:TArray;
         i:Integer :=1;
      begin

         l:=PreOrder(t.LeftT);
         for I in l'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;


         r:=PreOrder(t.RightT);

         for J in r'Range loop
            a(i):= l(I);
            i:=i+1;
         end loop;

         a(i):=T.d;
         i:=i+1;




        return a;
      end PostOrder;



end Tree;
