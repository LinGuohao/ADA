with PQueue, Ada.Command_Line, Ada.Integer_Text_IO , Ada.Text_IO; use PQueue;
procedure testQueue is

   N: Integer;
   V: Queue(Ada.Command_Line.Argument_Count);
begin
   for I in 1..Ada.Command_Line.Argument_Count loop
       N := Integer'Value(Ada.Command_Line.Argument(I));
       Push( V, N );
   end loop;
   Ada.Integer_Text_IO.Put(Size(V));
   Pop(V,N);
   Ada.Integer_Text_IO.Put(Size(V));
   while not Is_Empty(V) loop
        Pop( V, N );
        Ada.Integer_Text_IO.Put(N);
    end loop;



end testQueue;
