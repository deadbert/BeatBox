require_relative 'node'

class LinkedList
    attr_reader :head

    def initialize
        @head = nil
    end

    def append(data)
        new_node = Node.new(data)
        @head == nil ? (return @head = new_node) : @head = @head
        tail_node = search_nodes
        tail_node.next_node = new_node
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
        @head == nil ? (return "") : current_node = @head
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

    def insert(index, data)
        new_node = Node.new(data)
        if @head == nil && index == 0
            return @head = new_node
        elsif @head.is_a? Node
            current_node = @head
            count = 0
            until (index - 1) == count do
                current_node = current_node.next_node
                count += 1
            end
            new_node.next_node = current_node.next_node
            current_node.next_node = new_node
        else
            "Index out of range"
        end
    end

    def find(index, num_nodes)
        return "No elements in list" if @head == nil
        return "Index out of range" if count < index
        current_node = @head
        count = 0
        element_count = 0
        output = ""
        until index == count do
            current_node = current_node.next_node
            count += 1
        end
        until num_nodes == element_count
            output << current_node.data + " "
            current_node = current_node.next_node
            element_count += 1
        end
        output.strip
    end

    def includes?(data)
        return "No elements in list" if @head == nil
        current_node = @head
        until current_node.next_node == nil do
            if current_node.data == data
                return true
            end
            current_node = current_node.next_node
        end
        current_node.data == data ? true : false
    end

    def pop
        return "No elements in list" if @head == nil
        current_node = @head
        list_count = count
        current_index = 0
        until current_index == (list_count - 2) do 
            current_node = current_node.next_node
            current_index += 1
        end
        current_node.next_node = nil
    end
end 