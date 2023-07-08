require_relative 'node'
require_relative 'linked_list'

class BeatBox
  attr_accessor :list, :rate, :voice

  # on initialize BeatBox creates a new list object and has
  # a base voice and rate for playing sounds, as well as a 
  # list of acceptable words to beatbox
  def initialize
    @list = LinkedList.new
    @ok_words = ["tee", "dee", "deep", "bop", "boop", "la", "na",
                 "shu", "woo", "ditt", "doo", "hoo", "tee", "wee"]
    @rate = 500
    @voice = "Boing"
  end

  # use iteration and the append method from list class to 
  # add each nodes data to the list 1 by 1
  def append(words)
    words = validate_input(words) #returns a list with only accepted words
    words.each do |word|
      new_node = Node.new(word)
      @list.append(new_node.data)
    end
  end

  def count #calls count method from list object to get list length
    @list.count
  end

  def play #gather all nodes from list and use string interpolation to make terminal command
    beats = @list.to_string
    `say -r "#{@rate}" -v "#{@voice}" "#{beats}"`
  end

  def validate_input(string) 
    words = string.split #split given string into array of individual words
    validated_words = [] #empty array to be filled with only validated words
    words.select do |word|
      validated_words << word if @ok_words.include?(word) #word is in ok_words? true adds word to validated array
    end
    validated_words #returns validated words as an array
  end

  def reset_rate 
    @rate = 500

  end

  def reset_voice
    @voice = "Boing"
  end

end