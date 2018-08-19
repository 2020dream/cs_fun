# class Node
#     attr_reader :data
#     attr_accessor :next

#     def initialize(data)
#         @data = data
#         @next = nil
#     end
# end

# class LinkedList
#     attr_reader :head, :length
    
#     def initialize
#         @head = nil
#         @length = 0
#     end

#     # method to add a new node with the specific input data value in the linked list. Insert the new node at the beginning of the linked list
#     def insert(value)
#         new_node = Node.new(value)
#         new_node.next = @head
#         @head = new_node
#         @length += 1
#     end

#     # method to find if the linked list contains a node with specified input value. Returns true if found, false otherwise.
#     def search(value)
#         return false if @length == 0

#         current = @head
#         if current.data == value
#             return true
#         else
#             while current.next != nil
#                 if current.next.data == value
#                     return true
#                 else
#                     current = current.next
#                 end
#             end
#             return false
#         end
#     end

#     # method to return the max value in the linked list. Returns the data value and not the node.
#     def find_max
#         return nil if @length == 0

#         current = @head
#         max = current.data
#         while current.next != nil
#             if current.next.data > max
#                 max = current.next.data
#             end
#             current = current.next
#         end

#         return max
#     end

#     # method to return the min value in the linked list. Returns the data value and not the node.
#     def find_min
#         return nil if @length == 0

#         current = @head
#         min = current.data
#         while current.next != nil
#             if current.next.data < min
#                 min = current.next.data
#             end
#             current = current.next
#         end

#         return min
#     end

#     # method to return the value of the nth element from the beginning. n is the input to the method. Assume indexing starts at 0 while counting to n.
#     def find_nth_from_beginning(n)
#         raise ArgumentError.new() if n >= @length

#         current = @head
#         n.times do
#             current = current.next
#         end

#         return current.data
#     end

#     # method to insert a new node with specific input data value, assuming the linked list is sorted in ascending order.
#     def insert_ascending(value)
#         new_node = Node.new(value)

#         if @length == 0
#             @head = new_node
#             @length += 1
#         elsif value <= @head.data
#             new_node.next = @head
#             @head = new_node
#             @length += 1
#         else
#             current = @head

#             while current.next != nil
#                 if current.next.data > value
#                     new_node.next = current.next
#                     current.next = new_node
#                     @length += 1
#                     return
#                 else
#                     current = current.next
#                 end
#             end

#             current.next = new_node
#             @length += 1
#         end
#     end

#     # method to print all the values in the linked list
#     def visit
#         current = @head
#         output =""
        
#         while current != nil
#             output += current.data.to_s + " "
#             current = current.next
#         end

#         return output
#     end

#     # method to delete the first node found with the specified value taken as input.
#     def delete(value)
#         return false if value == nil || @length == 0
#         return false if @length == 1 && @head.data != value   

#         current = @head
#         if current.data == value
#             @head = current.next
#             @length -= 1
#             return true
#         else
#             while current.next != nil
#                 if current.next.data == value
#                     current.next = current.next.next
#                     @length -= 1
#                     return true
#                 end
#                 current = current.next
#             end
#             return false
#         end
#     end

#     # method to reverse the singly linked list. The nodes should be moved and not just the values in the nodes.
#     def reverse
#         node_arr = []

#         current = @head
#         while current != nil
#             node_arr << current
#             current = current.next
#         end

#         @head = nil
#         node_arr.each do |node|
#             insert(node.data)
#         end
#     end

#     # Returns the value at the middle element in the singly linked list. If the node count is even, pick one of the two middle values to return.
#     def find_middle_value
#         return nil if @length == 0

#         count = 0
#         if @length % 2 == 0
#             count = @length / 2
#         else
#             count = @length / 2 + 1
#         end

#         current = @head
#         (count - 1).times do
#             current = current.next
#         end

#         return current.data
#     end

#     # find the nth node from the end and return its value. Assume indexing starts at 0 while counting to n.
#     def find_nth_from_end(n)
#         raise ArgumentError.new() if n >= @length

#         current = @head
#         (@length - n - 1).times do
#             current = current.next
#         end

#         return current.data
#     end

#     # Checks if the linked list has a cycle. A cycle exists if any node in the linked list links to a node already visited. Returns true if a cycle is found, false otherwise.
#     def has_cycle
#         return false if @length < 2

#         current1 = @head
#         current2 = @head
#         until current2 == nil || current2.next == nil
#             current1 = current1.next
#             current2 = current2.next.next
#             if current1 == current2
#                 return true
#             end
#         end

#         return false
#     end

# end

# 707
class MyLinkedList
    
    class Node
        attr_accessor :val, :next
        
        def initialize(val)
            @val = val
            @next = nil
        end
    end

=begin
    Initialize your data structure here.
=end
    def initialize()
        @head = nil
        @length = 0
    end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        if index > @length - 1 || index < 0
            return -1
        else
            current = @head
            index.times do 
                current = current.next
            end
            return current.val 
        end
    end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        new = Node.new(val)
        new.next = @head
        @head = new
        @length += 1
    end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        new = Node.new(val)
        if @length == 0
            @head = new
        else
            current = @head
            (@length - 1).times do
                current = current.next
            end
            current.next = new
        end
        @length += 1        
    end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)        
        return if index > @length || index < 0
        
        new_node = Node.new(val) 
        if index == 0
            add_at_head(val)
        elsif index == @length
            add_at_tail(val)
        else
            current = @head
            (index - 1).times do
                current = current.next
            end
            new_node.next = current.next
            current.next = new_node
            @length += 1 
        end
    end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        return if index > @length - 1 || index < 0 || @length == 0
        
        if index == 0
            @head = @head.next
        else
            prev = @head
            current = prev.next
            (index - 1).times do
                prev = current
                current = prev.next
            end
            prev.next = current.next
        end
        @length -= 1
    end

end     

