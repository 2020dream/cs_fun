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
  
  def initialize(root_node)
      @root = root_node
  end

  # Print elements inorder
  def print_inorder
      inorder_helper(root)
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
      return search_helper(root, value) ? true : false
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
end

node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
node_4 = Node.new(4)
node_5 = Node.new(5)

bst = BinarySearchTree.new(node_2)
node_2.left = node_1
node_2.right = node_4
node_4.left = node_3
node_4.right = node_5

bst.print_inorder
puts bst.search(1)
puts bst.search(10)





