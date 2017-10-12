require_relative "deck"

class Hand
  attr_accessor :cards,:deck

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

  def self.tiebreaker(*hands)
    hands.max do |hand1, hand2|
      hand1_kicker = hand1.cards.max do |a, b|
        Card.possible_faces.index(a) <=> Card.possible_faces.index(b)
      end

      hand2_kicker = hand2.cards.max do |a, b|
        Card.possible_faces.index(a) <=> Card.possible_faces.index(b)
      end

      hand1_kicker <=> hand2_kicker
    end
  end

  private

  def build_hand
    result = []
    5.times { result << @deck.draw }
    result
  end
end
