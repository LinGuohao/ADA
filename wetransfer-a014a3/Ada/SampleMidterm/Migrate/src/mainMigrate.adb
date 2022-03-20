with Migrate, Ada.Integer_Text_IO,Ada.Text_IO;
use Ada.Integer_Text_IO,Ada.Text_IO;

procedure Main is




   type mat is array(Integer range <>,Integer range <>) of Natural;

   procedure Print ( M: in mat ) is
    begin
        for I in M'Range(1) loop
            for J in M'Range(2) loop
                Put( M(I,J) );
                --Put( Ascii.HT );
            end loop;
            New_Line;
        end loop;
    end Print;


   procedure myMig is new Migrate(Integer,mat);

   m: mat :=((10,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,6,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),
             (1,1,1,1,1,1,1,1,1,1),(1,1,1,1,4,1,1,1,1,1),(1,1,1,1,1,1,1,1,1,1),(1,1,1,1,1,1,9,1,1,1),(1,1,1,1,1,1,1,1,1,1));


begin

   myMig(m,3);
   print(m);
end Main;
