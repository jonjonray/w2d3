require_relative "card.rb"


class Deck
attr_accessor :stack

  def initialize
    @stack = build_deck
  end

  def shuffle
    @stack = build_deck
    @stack.shuffle!
  end

  def draw
    @stack.pop
  end



  private

  def build_deck
    result = []
    Card.possible_suits.each do |suit|
      Card.possible_faces.each do |face|
        result << Card.new(face,suit)
      end
    end
    result
  end

end
