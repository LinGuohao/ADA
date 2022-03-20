with Queuegen, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

   package IQueue is new Queuegen(Integer);
   use IQueue;

Max: Integer;

    procedure Menu ( V: in out Queue ) is
        Parancs: Integer;

        procedure Insert( V: in out Queue ) is
             data: Integer;
        begin
             Put("What would you like to insert? "); Get(data);
             Push(V, data);
        exception
             when Full_Queue =>
                     Put_Line("Queue is full!");
        end Insert;

        procedure Delete( V: in out Queue ) is
             data: Integer;
        begin
             Pop(V, data);
             Put("The data extracted"); Put(data); New_Line;
        exception
             when Empty_Queue =>
                     Put_Line("Queue empty!");
        end Delete;

    begin
        loop
            Put_Line("Operations: push (1), pop (2), quit (0)");
            Get(Parancs);
            case Parancs is
                when 1 => Insert(V);
                when 2 => Delete(V);
                when 0 => exit;
                when others => null;
            end case;
        end loop;
    end Menu;

begin
    Put( "The size of the stack: " ); Get(Max);
    declare
        V: Queue(Max);
    begin
        Menu(V);
    end;
end Main;
