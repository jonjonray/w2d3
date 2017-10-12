require "rspec"
require "card"
require "deck"
require "hand"
require "player"
require "game"

describe Card do
  describe "#initialize" do
    subject(:card) {Card.new(:K,:spade)}
    it "has a face value" do
      expect(card.face).to eq(:K)
    end

    it "has a suit" do
      expect(card.suit).to eq(:spade)
    end

  end
end

describe Deck do
  describe "#initialize" do
    subject(:deck) { Deck.new }

    it "length of 52 cards" do
      expect(deck.stack.length).to eq(52)
    end

    it "every card is unique" do
      expect(deck.stack.uniq { |card| [card.face, card.suit] }).to eq(deck.stack)
    end
  end

  describe "#shuffle" do
    subject(:deck) { Deck.new }

    it "deck still has 52 cards" do
      deck.shuffle
      expect(deck.stack.length).to eq(52)
    end

    it "alters card order" do
      original_deck = deck.stack
      deck.shuffle
      expect(deck.stack).to_not eq(original_deck)
    end
  end

  describe "#draw" do
    subject(:deck) { Deck.new }

    it "returns a card" do
      expect(deck.draw).to be_a(Card)
    end

    it "removes a card from the deck" do
      deck.draw
      expect(deck.stack.length).to_not eq(52)
    end
  end
end

describe Hand do
  describe "#initialize" do
    subject(:hand) { Hand.new }

    it "creates a 5-card hand" do
      expect(hand.cards.length).to eq(5)
    end

    it "takes in a deck" do
      expect(hand.deck).to be_a(Deck)
    end
  end
end
