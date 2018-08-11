class Node
    attr_reader :data
    attr_accessor :next

    def initialize(data)
        @data = data
        @next = nil
    end
end

class LinkedList
    attr_reader :head, :length
    
    def initialize
        @head = nil
        @length = 0
    end

    # method to add a new node with the specific input data value in the linked list. Insert the new node at the beginning of the linked list
    def insert(value)
        new_node = Node.new(value)
        new_node.next = @head
        @head = new_node
        @length += 1
    end

    # method to find if the linked list contains a node with specified input value. Returns true if found, false otherwise.
    def search(value)
        return false if @length == 0

        current = @head
        if current.data == value
            return true
        else
            while current.next != nil
                if current.next.data == value
                    return true
                else
                    current = current.next
                end
            end
            return false
        end
    end

    # method to return the max value in the linked list. Returns the data value and not the node.
    def find_max
        return nil if @length == 0

        current = @head
        max = current.data
        while current.next != nil
            if current.next.data > max
                max = current.next.data
            end
            current = current.next
        end

        return max
    end

    # method to return the min value in the linked list. Returns the data value and not the node.
    def find_min
        return nil if @length == 0

        current = @head
        min = current.data
        while current.next != nil
            if current.next.data < min
                min = current.next.data
            end
            current = current.next
        end

        return min
    end

    # method to return the value of the nth element from the beginning. n is the input to the method. Assume indexing starts at 0 while counting to n.
    def find_nth_from_beginning(n)
    end

    # method to insert a new node with specific input data value, assuming the linked list is sorted in ascending order.
    def insert_ascending(node)
    end

    # method to print all the values in the linked list
    def visit
    end

    # method to delete the first node found with the specified value taken as input.
    def delete(value)
    end

    # method to reverse the singly linked list. The nodes should be moved and not just the values in the nodes.
    def reverse
    end

    # Returns the value at the middle element in the singly linked list. If the node count is even, pick one of the two middle values to return.
    def find_middle_value
    end

    # find the nth node from the end and return its value. Assume indexing starts at 0 while counting to n.
    def find_nth_from_end
    end

    # Checks if the linked list has a cycle. A cycle exists if any node in the linked list links to a node already visited. Returns true if a cycle is found, false otherwise.
    def has_cycle
    end

end

