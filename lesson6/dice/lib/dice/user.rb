require_relative 'validations'

class User

  include Validations

  attr_reader :name, :score
  attr_accessor :total_credits

  def initialize user
    @name = user
  end

  def bet score:, credits:
    @score = score
    @credits = credits
  end

  def loses
    @total_credits -= @credits
    puts "#{@name} loses"
  end

  def wins
    @total_credits += (@credits * DiceGame::GAIN).ceil
    puts "#{@name} wins"
  end

  def validate_presence_of_bet
    validate_presence @credits
  end

  def validate_score max
    validate_maximum @score, max
  end

end
