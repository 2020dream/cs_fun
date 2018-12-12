class Node
    attr_reader :value
    attr_accessor :next

    def initialize(value)
        @value = value
        @next = nil
    end
end

class LinkedList
    attr_reader :head

    def initialize(head_node)
        @head = head_node
    end

    # Add new node to end of linked list
    def add_to_end(node)
        current = @head

        while current.next
            current = current.next
        end

        current.next = node
    end

    # Print all values from head to end
    def print
        current = @head

        while current
            puts current.value
            current = current.next
        end
    end
end

node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)

ll = LinkedList.new(node_1)
ll.add_to_end(node_2)
ll.add_to_end(node_3)

ll.print

