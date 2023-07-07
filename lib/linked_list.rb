require_relative 'node'

class LinkedList
    attr_reader :head

    def initialize
        @head = nil
    end

    def append(data)
        new_node = Node.new(data)
        if @head == nil
            @head = new_node
        elsif @head.is_a? Node
            current_node = @head
            until current_node.next_node == nil do
                current_node = current_node.next_node
            end
            current_node.next_node = new_node
        end
    end

end