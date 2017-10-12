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
    let(:deck) {Deck.new}
    subject(:hand) { Hand.new(deck)}

    it "creates a 5-card hand" do
      expect(hand.cards.length).to eq(5)
    end

    it "takes in a deck" do
      expect(hand.deck).to be_a(Deck)
    end
  end

  describe "#strength_of_hand" do
    let(:deck) {Deck.new}
    subject(:hand) { Hand.new(deck) }
    let(:card1) {Card.new(:A, :spade)}
    let(:card2) {Card.new(2, :heart)}
    let(:card3) {Card.new(3, :diamond)}
    let(:card4) {Card.new(4, :spade)}
    let(:card5) {Card.new(5, :spade)}

    it "returns index of the hand tier" do
      hand.cards = [card1,card2,card3,card4,card5]
      expect(hand.strength_of_hand).to eq(4)
    end
  end

  describe "#tiebreaker" do
    let(:deck) {Deck.new}
    subject(:hand1) { Hand.new(deck) }
    subject(:hand2) { Hand.new(deck) }
    subject(:hand3) { Hand.new(deck) }

    it "returns hand with winning kicker" do
      expect(Hand.tiebreaker(hand1, hand2)).to be([hand1])
    end

    it "returns multiple hands if they are equal" do
      expect(Hand.tiebreaker(hand1, hand2)).to be([hand1, hand2])
    end

    it "takes in multiple hands" do
      expect(Hand.tiebreaker(hand1, hand2, hand3)).to_not raise_error
    end
  end
end
