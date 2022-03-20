procedure Migrate(g: in out Grid ;max: Natural) is
   temp : Integer;
begin
   for i in g'Range(1) loop
      for j in g'Range(2) loop
         temp:=g(i,j)-max;
         if(temp>0) then
            g(i,j):=max;

            if(i=g'First(1)) then
               --first element of matrix
               if(j=g'First(2)) then
                  --if there is place in the right
                  if (g(i,Index'Succ(j))<max) then
                     temp:=temp - (max- g(i,Index'Succ(j)));
                     g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place down
                     if (g(Index'Succ(i),j)<max) then
                        temp:=temp - (max- g(Index'Succ(i),j));
                        g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                     end if;

                  end if;

               -- end of first row
               elsif (j=g'Last(2)) then
                  --if there is place on the left
                  if (g(i,Index'Pred(j))<max) then
                     temp:=temp - (max- g(i,Index'Pred(j)));
                     g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place down
                     if (g(Index'Succ(i),j)<max) then
                        temp:=temp - (max- g(Index'Succ(i),j));
                        g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                     end if;
                  end if;

               -- middle of first row
               else
                  --if there is place in the left
                  if(g(i,Index'Pred(j))<max) then
                           temp:=temp - (max- g(i,Index'Pred(j)));
                           g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                        end if;

                  --if we still need to add
                  if (temp>0) then
                     --if there is place down
                     if (g(Index'Succ(i),j)<max) then
                        temp:=temp - (max- g(Index'Succ(i),j));
                        g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                     end if;
                     --if we still need to add
                     if(temp>0) then
                        --if there is place right
                        if (g(i,Index'Succ(j))<max) then
                           temp:=temp - (max- g(i,Index'Succ(j)));
                           g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                        end if;
                     end if;


                  end if;

               end if;

            --if we are on last row
            elsif (i=g'Last(1)) then
               -- beginning of last row
               if(j=g'First(2)) then
                  --if there is place in the right
                  if (g(i,Index'Succ(j))<max) then
                     temp:=temp - (max- g(i,Index'Succ(j)));
                     g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;

                  end if;

               -- end of last row
               elsif (j=g'Last(2)) then
                  --if there is place on the left
                  if (g(i,Index'Pred(j))<max) then
                     temp:=temp - (max- g(i,Index'Pred(j)));
                     g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;
                  end if;

               -- middle of last row
               else
                  --if there is place in the left
                  if(g(i,Index'Pred(j))<max) then
                           temp:=temp - (max- g(i,Index'Pred(j)));
                           g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                        end if;

                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;
                     --if we still need to add
                     if(temp>0) then
                        --if there is place right
                        if (g(i,Index'Succ(j))<max) then
                           temp:=temp - (max- g(i,Index'Succ(j)));
                           g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                        end if;
                     end if;


                  end if;

               end if;

            --we are somewehere in the middle rows
            else
               --beginning of row
               if(j=g'First(2)) then
                  --if there is place in the right
                  if (g(i,Index'Succ(j))<max) then
                     temp:=temp - (max- g(i,Index'Succ(j)));
                     g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;
                     if (temp>0) then
                        --if there is place down
                        if (g(Index'Succ(i),j)<max) then
                           temp:=temp - (max- g(Index'Succ(i),j));
                           g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                        end if;
                     end if;
                  end if;

               elsif (j=g'Last(2)) then
                  --if there is place on the left
                  if (g(i,Index'Pred(j))<max) then
                     temp:=temp - (max- g(i,Index'Pred(j)));
                     g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;

                     --if we still need to add
                     if (temp>0) then
                        --if there is place down
                        if (g(Index'Succ(i),j)<max) then
                           temp:=temp - (max- g(Index'Succ(i),j));
                           g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                        end if;
                     end if;
                  end if;

               --in the middle of any middle row row
               else
                  --if there is place on the left
                  if (g(i,Index'Pred(j))<max) then
                     temp:=temp - (max- g(i,Index'Pred(j)));
                     g(i,Index'Pred(j)) := g(i,Index'Pred(j)) + (max- g(i,Index'Pred(j)));
                  end if;
                  --if we still need to add
                  if (temp>0) then
                     --if there is place up
                     if (g(Index'Pred(i),j)<max) then
                        temp:=temp - (max- g(Index'Pred(i),j));
                        g(Index'Pred(i),j) :=  g(Index'Pred(i),j) + (max-  g(Index'Pred(i),j));
                     end if;

                     --if we still need to add
                     if (temp>0) then
                        --if there is place down
                        if (g(Index'Succ(i),j)<max) then
                           temp:=temp - (max- g(Index'Succ(i),j));
                           g(Index'Succ(i),j) :=  g(Index'Succ(i),j) + (max-  g(Index'Succ(i),j));
                        end if;

                        if(temp>0) then
                        --if there is place right
                        if (g(i,Index'Succ(j))<max) then
                           temp:=temp - (max- g(i,Index'Succ(j)));
                           g(i,Index'Succ(j)) := g(i,Index'Succ(j)) + (max- g(i,Index'Succ(j)));
                        end if;
                     end if;
                     end if;
                  end if;

               end if;

            end if;

         end if;



      end loop;
   end loop;

end Migrate;
