require_relative 'jump/mothership'
require_relative 'jump/ship'

cloud9    = Mothership.new
whitestar = Ship.new

whitestar.jump { cloud9 }
