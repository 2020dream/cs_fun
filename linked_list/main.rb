class Node
    attr_reader :data
    attr_accessor :next

    def initialize(data)
        @data = data
        @next = nil
    end

    def get_data()
        return @data
    end

    def get_next_node()
        return @next
    end

    def set_next_node(node)
        @next = node
    end
end

class LinkedList
    attr_reader :head
    attr_reader :length
    
    def initialize
        @head = nil
        @length = 0
    end

    def insert(node)
        node.next = @head
        @head = node
        @length += 1
    end

end

n1 = Node.new(3)
n2 = Node.new(2)
n3 = Node.new(1)

list = LinkedList.new()
list.insert(n1)
list.insert(n2)
list.insert(n3)

puts list.head.data
puts list.length

