function Map(x: Tarray) return Tb is
   ba:Tb(x'Range);
begin

   for i in x'First..x'Last loop
      ba(i):=op(x(i));
   end loop;
   return ba;
end Map;
