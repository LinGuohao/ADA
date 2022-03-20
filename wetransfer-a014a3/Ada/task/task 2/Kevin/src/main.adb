procedure Main is

   protected Printer is
      procedure Print(String s);
   end Printer;



   task Door is
      entry Open;
      entry Close;
   end Door;

   task body Door is
   begin
      entry Open when
   end Door;

   task Burglar;

   task body Burglar is
   begin
   end Burglar;


begin
   --  Insert code here.
   null;
end Main;
