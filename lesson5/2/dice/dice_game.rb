require_relative 'dice'

module DiceGame

  START_CREDITS = 2000
  GAIN = 0.25

  attr_reader :score, :credits
  attr_accessor :total_credits

  def self.create *players
    @players = players.each { |p| p.total_credits = START_CREDITS }
    @dices = Dice.new
    self
  end

  def self.turn
    sum = @dices.throw
    puts "\nWheel of fortune throws: #{sum}"

    @players.each do |player|
      player.validate_presence_of_bet
      player.validate_score @dices.max

      player.score == sum ? player.wins : player.loses
    end
  end

  def self.finish
    puts "\nGame results:"
    @players.each { |p| puts "#{p.name} earns #{p.total_credits} credits" }
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
    @total_credits += (@credits * GAIN).ceil
    puts "#{@name} wins"
  end

  def validate_presence_of_bet
    validate_presence @credits
  end

  def validate_score max
    validate_maximum @score, max
  end
end