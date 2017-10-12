require_relative "deck"

class Hand
  HAND_TIER = [
    :kicker,
    :pair,
    :two_pair,
    :three_of_a_kind,
    :straight,
    :flush,
    :full_house,
    :four_of_a_kind,
    :straight_flush,
    :royal_flush
  ]

  def initialize(deck)
    @deck = deck
    @cards = build_hand
  end

  def strength_of_hand
    
  end

  private

  def build_hand
    result = []
    5.times { result << @deck.draw }
    result
  end
end
