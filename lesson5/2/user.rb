require_relative 'validations'

class User

  include DiceGame
  include Validations

  attr_reader :name

  def initialize user
    @name = user
  end

end