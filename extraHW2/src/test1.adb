with ADA.Text_IO;use ADA.Text_IO;
procedure test1 is

   protected task1 is
      entry call;
      entry change;
   private
      cancall:Boolean:=False;
   end task1;
   task task3 is
      entry call;
   end task3;

   protected body task1 is
      entry call when cancall is
      begin
         task3.call;
      end call;

      entry change when true is
      begin
         cancall := True;
      end change ;
   end task1;
   task task2;

   task body task3 is
   begin
      accept call  do
         Put_Line("In 3");
      end call;
   end task3;


   task body task2 is
   begin
      task1.call;
   end task2;





begin
   delay 5.0;
   task1.change;

end test1;
