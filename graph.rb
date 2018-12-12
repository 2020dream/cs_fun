class Node
    attr_reader :value, :neighbors

    # Use array to save neighbors information in a node
    def initialize(value)
       @value = value
       @neighbors = []
    end

    # Edge information is saved with neighbor node in a 2-element array
    def add_neighbor(neighbor, weight)
        @neighbors << [neighbor, weight]
    end
end

class Graph
    # Use hash to save nodes in a graph
    def initialize
        @nodes = {}
    end

    # Use node.value as key for quick access (require all nodes have unique values)
    def add_node(node)
        @nodes[node.value] = node
    end

    # Edge information is saved with neighbor node in a 2-element array
    def add_edge(node1, node2, weight)
        @nodes[node1.value].add_neighbor(@nodes[node2.value], weight)
    end

    # Search a value in a graph from a source node
    def search_BFS(source, search_value)
        # Use queue to save nodes to visit at current level
        to_visit = []

        # Use array to keep track of visited nodes
        visited = []

        # Enqueue source node
        to_visit << source

        # Label source code as visited
        visited << source
        
        # Search value until no node left in the graph
        while !to_visit.empty?
            # Dequeue first node in to_visit
            current_node = to_visit.shift

            # When found value in graph, return true
            if current_node.value == search_value
                return true
            end

            # Enqueue all unvisited neighbor nodes & label as visited
            current_node.neighbors.each do |neighbor|
                if !visited.include?(neighbor[0])
                    to_visit << neighbor[0]
                    visited << neighbor[0]
                end
            end
        end

        # Return false if never find value in graph
        return false
    end

    def has_path_DFS(source_value, destination_value)
        # Find source and destination nodes in graph
        source = @nodes[source_value]
        destination = @nodes[destination_value]

        # Use array to keep track on visited nodes
        visited = []

        return helper_has_path_DFS(source, destination, visited)
    end

    def helper_has_path_DFS(current, destination, visited)
        # If current is visited, there is no path found through current route
        if visited.include?(current)
            return false
        end
        
        # Label current as visited
        visited << current

        # If current is destination, return true
        if current == destination
            return true
        end

        # If current is not destination, search all neighbors of current node
        current.neighbors.each do |neighbor|
            if helper_has_path_DFS(neighbor[0], destination, visited)
                return true
            end
        end

        # Return false if never find a path in graph
        return false
    end
end

node_A = Node.new("A")
node_B = Node.new("B")
node_C = Node.new("C")
node_D = Node.new("D")
node_E = Node.new("E")

map = Graph.new()
map.add_node(node_A)
map.add_node(node_B)
map.add_node(node_C)
map.add_node(node_D)
map.add_node(node_E)

map.add_edge(node_A, node_B, 5)
map.add_edge(node_B, node_C, 4)
map.add_edge(node_C, node_D, 8)
map.add_edge(node_D, node_C, 8)
map.add_edge(node_D, node_E, 6)
map.add_edge(node_A, node_D, 5)
map.add_edge(node_C, node_E, 2)
map.add_edge(node_E, node_B, 3)
map.add_edge(node_A, node_E, 7)

puts map.search_BFS(node_A, "C")
puts map.has_path_DFS("A", "D")
puts map.has_path_DFS("B", "A")