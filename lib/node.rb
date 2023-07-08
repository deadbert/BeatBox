class Node
    attr_reader :data
    attr_accessor :next_node

    #initialize a Node object with given data, and default nil next_node
    def initialize(data)
        @data = data
        @next_node = nil
    end
end