require 'minitest/autorun'
require 'minitest/reporters'
require_relative './main.rb'

describe "Node" do
    before do
        @node = Node.new(1)
    end

    describe "initialize" do
        it "creates an instance of Node" do
            @node.must_be_instance_of Node
        end

        it "takes and sets data" do
            @node.data.must_equal 1
        end

        it "sets next to nil" do
            @node.next = nil
        end
    end
end

# linked list is empty
# linked list has only one node
# linked list has odd number of nodes
# linked list has even number of nodes
describe "LinkedList" do
    before do
        @list = LinkedList.new()
    end

    describe "initialize" do
        it "creates an instance of LinkedList" do
            @list.must_be_instance_of LinkedList
        end

        it "sets head to nil and length to 0" do
            @list.head.must_equal nil
            @list.length.must_equal 0
        end
    end

    describe "insert" do
        it "adds the value to the beginning of the linked list" do
            @list.insert(1)
            @list.head.data.must_equal 1
            @list.length.must_equal 1

            @list.insert(2)
            @list.head.data.must_equal 2
            @list.length.must_equal 2
        end
    end

    describe "search" do
        it "returns true if linked list with more than one node contains a node with specified input value" do
            @list.insert(1)
            @list.insert(2)
            @list.insert(3)

            @list.search(2).must_equal true
        end

        it "returns false if linked list with more than one node doesn't contain a node with specified input value" do
            @list.insert(1)
            @list.insert(2)
            @list.insert(3)

            @list.search(4).must_equal false
        end

        it "returns true if linked list with only one node whose value is the specified input value" do
            @list.insert(1)
            @list.search(1).must_equal true
        end

        it "returns false if linked list with only one node whose value is not the specified input value" do
            @list.insert(1)
            @list.search(2).must_equal false
        end

        it "returns false if linked list is empty" do
            @list.search(1).must_equal false
        end
    end

    describe "find_max" do
    end

    describe "find_min" do
    end

    describe "find_nth_from_beginning" do
    end

    describe "insert_ascending" do
    end

    describe "visit" do
    end

    describe "delete" do
    end

    describe "reverse" do
    end

    describe "find_middle_value" do
    end

    describe "find_nth_from_end" do
    end

    describe "has_cycle" do
    end

end