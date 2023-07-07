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
            tail_node = search_nodes
            tail_node.next_node = new_node
        end
    end

    def search_nodes
        current_node = @head
        until current_node.next_node == nil do
            current_node = current_node.next_node
        end
        current_node
    end

    def count
        count = @head == nil ? (return 0): 1
        current_node = @head
        until current_node.next_node == nil do
            current_node = current_node.next_node
            count += 1
        end
        count
    end

    def to_string
        output_list = ""
        current_node = @head
        return "" if current_node == nil
        until current_node.next_node == nil do
            output_list << current_node.data + " "
            current_node = current_node.next_node
        end
        output_list << current_node.data
    end

    def prepend(data)
        new_node = Node.new(data)
        new_node.next_node = @head
        @head = new_node
    end

end