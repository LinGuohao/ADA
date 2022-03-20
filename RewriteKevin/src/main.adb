with ADA.Text_IO;use ADA.Text_IO;
procedure Main is
   protected Printer is
      procedure Print(S:in String);
   end Printer;

   task Door is
      entry Open;
      entry Close;
   end Door;
   task Burglar;
   --------------------body---------------------------
   protected body Printer is
      procedure Print(S:in String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;


   task body Door is
      is_Open : Boolean := True;
   begin
      loop
         select
            accept Open  do
               is_Open:=True;
               Printer.Print("Door is opened.");
            end Open;
         or
            accept Close  do
               is_Open := False;
               Printer.Print("Door is closed.");
            end Close;
         or
            terminate;
         end select;
      end loop;
   end Door;

   task body Burglar is
   begin
      delay 1.0;
      select
         Door.Open;
      else
         Printer.Print("Cant open the door.");
      end select;
      delay 3.0;

      select
         Door.Close;
      else
         Printer.Print("Cant close the door.");
      end select;
   end Burglar;


begin
   --  Insert code here.
   null;
end Main;
