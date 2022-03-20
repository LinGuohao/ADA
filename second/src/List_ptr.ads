generic
	type Elem is private;

package List_ptr is

	type List_ptr is private limited;
   procedure add(x: in Elem;my_List:in List_ptr);
   function size(my_List : in List_ptr) return Natural;
private
   type Node;
   type Node_pointer is access Node;
	type Node is record
      Item: Elem;
      next: Node_pointer;

   end record;
   head : Node_pointer;


end List_ptr;
