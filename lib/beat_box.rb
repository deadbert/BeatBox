require_relative 'node'
require_relative 'linked_list'

class BeatBox
  attr_accessor :list
  def initialize
    @list = LinkedList.new
  end

  def append(words)
    word_split = words.split
    word_split.each do |word|
      new_node = Node.new(word)
      @list.append(new_node.data)
    end
  end

  def count
    @list.count
  end

end