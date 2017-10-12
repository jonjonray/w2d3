require "rspec"
require "towers_of_hanoi"

describe Tower do
  subject(:tower1) {Tower.new([3,2,1])}

  describe "#move" do
    let(:tower2) {Tower.new}
    let(:tower3) {Tower.new}
    it "move only moves top disc" do
      before(:each) do
        tower1.move(tower2)
      end

      expect(tower1.stack).to eq([3, 2])
      expect(tower2.stack).to eq([1])
    end

    it "doesn't allow larger disc on top of smaller one" do
      expect(tower1.move(tower2)).to raise_error(StandardError)
    end
  end
end

describe Game do
  subject(:game) {Game.new}

  describe "#won?" do
    let(:tower1) {double("tower1", :stack => [3,2,1])}
    let(:tower2) {double("tower2", :stack => [])}
    it "returns false when game is still in play" do
      expect(game.won?).to be false
    end

    it "returns true when game is won" do
      tower1.stack = []
      tower2.stack = [3, 2, 1]
      expect(game.won?).to be true
    end
  end
end
