require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data) #initialize a new node from passed in data
    if @head == nil
      @head = new_node
      return @head
    end
    current_node = @head
    while current_node.next_node != nil do
      current_node = current_node.next_node
    end
    current_node.next_node = new_node
  end

  def count #modified search node method with a counter, returns counter instead of final node in list
    count = @head == nil ? (return 0): 1 #returns 0 if no head node, or sets counter to 1 at start 
    current_node = @head
    until current_node.next_node == nil do #iterate through list, add 1 to count each iteration to count nodes
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def to_string
    output_list = ""
    @head == nil ? (return "") : current_node = @head #if list empty returns "" otherwise selects head to start loop
    until current_node.next_node == nil do
      output_list << current_node.data + " "
      current_node = current_node.next_node
    end
    #until loop will stop at last node, and not add the last node of data.
    # this line adds last node of data to the output string
    output_list << current_node.data 
  end

  def prepend(data) #add new node to at the @head of the list
    new_node = Node.new(data)
    new_node.next_node = @head #point new node to the current head node
    @head = new_node 
  end

  def insert(index, data)
    new_node = Node.new(data)
    if @head == nil && index == 0 
      return @head = new_node
    elsif (@head.is_a? Node) && (index < self.count) #check to ensure the given index isn't out range
      iter_count = 0
      index -= 1 #decrement index by 1 so I stop 1 Node early in list
      insert_search_replace(index, iter_count, new_node) #searches and inserts new node at given index
    else
      "Index out of range"
    end
  end

  def find(index, num_nodes) #starting at given index, return num_nodes EX: (1,3) returns node 2,3,4
    return "No elements in list" if @head == nil #catch case of find called on empty list
    return "Index out of range" if self.count < index #catch case of index being out of list range
    current_node = @head
    counter = 0
    find_search_replace(current_node, index, counter, num_nodes)
  end

  def includes?(data) #return bool: true if data is in list
    return "No elements in list" if @head == nil #catch case of includes? called on empty list
    current_node = @head
    until current_node.next_node == nil do 
      if current_node.data == data #iterate through nodes, if ANY node matches true is returned
        return true
      end
      current_node = current_node.next_node
    end
    current_node.data == data ? true : false #loop stops on last node, so perform check on last node data
  end

  def pop #remove last node in the list
    return "No elements in list" if @head == nil #catch if pop called on empty list
    current_node = @head
    list_count = count #calls count method to find total length of list
    list_count -= 2 #decrement list count so I stop on the node BEFORE last node
    current_index = 0
    until current_index == (list_count) do 
      current_node = current_node.next_node
      current_index += 1
    end
    current_node.next_node = nil #Set next_node of second to last node to nil, removing last node
  end

  def insert_search_replace(index, iter_count, new_node)
    current_node = @head
    until index == iter_count do
      current_node = current_node.next_node
      iter_count += 1
    end
    new_node.next_node = current_node.next_node #stop 1 node early to set the .next_node correctly
    current_node.next_node = new_node
  end

  def find_search_replace(current_node, index, counter, num_nodes)
    output = ""
    element_count = 0 #this variable is for counting the num_nodes argument once index is found
    until index == counter do
      current_node = current_node.next_node
      counter += 1
    end
    until num_nodes == element_count #new loop once index is found to return num_nodes
      output << current_node.data + " "
      current_node = current_node.next_node
      element_count += 1
    end
    output.strip! #remove trailing " " from how node data is added to output
    return output
  end
  
end 