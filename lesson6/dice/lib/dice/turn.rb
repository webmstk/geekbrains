module DiceGame
  class Turn
    def initialize player, dice
      @player = player
      @dice    = dice
      @sum     = @dice.throw
    end

    def resolve
      puts "\nWheel of fortune throws: #{@sum}"

      validate_turn
      @player.score == @sum ? @player.wins : @player.loses
    end

    def validate_turn
      @player.validate_presence_of_bet
      @player.validate_score @dice.max
    end
  end
end
