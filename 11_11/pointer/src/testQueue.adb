with Queuegen,Ada.Integer_Text_IO;use Ada.Integer_Text_IO;

procedure testQueue is
   package IntQueue is new Queuegen(Integer);
   use IntQueue;
   Q:Queue;
   int:Integer;
   tmp : Integer;
begin
   int := 1;
   Push(Q,1);
   Push(Q,2);
   Put(Top(Q));
   Pop(Q,tmp);
   Put(Top(Q));
   Put(Size(Q));
   Pop(Q,tmp);
   Put(Top(Q));
   Put(tmp);
   Pop(Q,tmp);
end testQueue;
