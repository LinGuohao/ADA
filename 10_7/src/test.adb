with double2, Ada.Text_IO;

generic
type Elem is private;
with function "<" (Left: in Elem; Right: in Elem) return Boolean is <>;
procedure sort (x,y:  in out Elem);

what is the result of the following instantiation

package sort_int is new sort(Integer);
