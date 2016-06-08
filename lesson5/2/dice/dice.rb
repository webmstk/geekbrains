module DiceGame
  class Dice

    DICES = 2
    EDGES = 6

    attr_reader :max

    def initialize
      @dices = []
      DICES.times { @dices.push 1.upto(EDGES).to_a }
      @max = maximum
    end

    def throw
      @dices.map { |d| d.sample }.reduce :+
    end

    def maximum
      @dices.inject(0) { |sum, d| sum + d.last }
    end
  end
end