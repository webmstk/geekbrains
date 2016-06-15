module DiceGame
  class Dice

    attr_reader :max

    def initialize quantity: 2, edges: 6
      @dice = []
      quantity.times { @dice.push 1.upto(edges).to_a }
      @max ||= maximum
    end

    def throw
      @dice.map { |d| d.sample }.reduce :+
    end

    def maximum
      @dice.inject(0) { |sum, d| sum + d.last }
    end
  end
end
