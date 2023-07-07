require_relative 'node'
require_relative 'linked_list'

class BeatBox
  attr_accessor :list, :rate, :voice
  def initialize
    @list = LinkedList.new
    @ok_words = ["tee", "dee", "deep", "bop", "boop", "la", "na",
                 "shu", "woo", "ditt", "doo", "hoo", "tee", "wee"]
    @rate = 500
    @voice = "Boing"
  end

  def append(words)
    words = validate_input(words)
    words.each do |word|
      new_node = Node.new(word)
      @list.append(new_node.data)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r "#{@rate}" -v "#{@voice}" "#{beats}"`
  end

  def validate_input(string)
    words = string.split
    validated_words = []
    words.select do |word|
      validated_words << word if @ok_words.include?(word)
    end
    validated_words
  end

  def reset_rate
    @rate = 500

  end

  def reset_voice
    @voice = "Boing"
  end

end