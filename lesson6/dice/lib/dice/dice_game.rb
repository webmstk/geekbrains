require_relative 'dice'
require_relative 'turn'

module DiceGame

  START_CREDITS = 2000
  GAIN = 0.25

  attr_reader :score, :credits

  def self.create *players
    @players = players.each { |p| p.total_credits = START_CREDITS }
    @dice = Dice.new
    self
  end

  def self.turn
    @players.each { |player| Turn.new(player, @dice).resolve }
  end

  def self.finish
    puts "\nGame results:"
    @players.each { |p| puts "#{p.name} earns #{p.total_credits} credits" }
  end
end
