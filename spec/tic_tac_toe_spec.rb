require './lib/tic_tac_toe.rb'

describe TicTacToe do
  # start with testing wins
  # Valid and invalid moves
  # draw condition
  # marker methods

  subject(:game) { described_class.new }

  describe "#play" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

end