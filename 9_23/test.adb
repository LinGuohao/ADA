
procedure array_example is

type Elem is new Integer;




begin
for i in reverse 1..5 loop
Put(Elem'image(arr(i)));
end loop;
end array_example;
