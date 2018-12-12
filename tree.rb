class Node
    attr_reader :value
    attr_accessor :left, :right

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end

class BinarySearchTree
    attr_reader :root

    def initialize
        @root = nil
    end

    # Print elements inorder
    def print_inorder
        inorder_helper(@root)
    end

    def inorder_helper(node)
        if node.nil?
            return
        end

        inorder_helper(node.left)
        puts node.value
        inorder_helper(node.right)
    end

    # Search element
    def search(value)
        return search_helper(@root, value) ? true : false
    end

    def search_helper(node, value)
        if node.nil?
            return
        end

        if value == node.value
            return true
        elsif value > node.value
            search_helper(node.right, value)
        else
            search_helper(node.left, value)
        end
    end

    # Insert element
    def insert(value)
        if @root == nil
            @root = Node.new(value)
            return
        end
        return insert_helper(@root, value)
    end

    def insert_helper(current, value)
        if value <= current.value
            if current.left != nil
                return insert_helper(current.left, value)
            else
                current.left = Node.new(value)
            end
        else
            if current.right != nil
                return insert_helper(current.right, value)
            else
                current.right = Node.new(value)
            end
        end
    end
end

# Use preordered elements to create bst
preorder_elements = [2, 1, 4, 3, 5]
bst = BinarySearchTree.new
preorder_elements.each do |e|
    bst.insert(e)
end

# Print all elements inorder
bst.print_inorder

# Search value in bst
puts bst.search(1)
puts bst.search(-1)