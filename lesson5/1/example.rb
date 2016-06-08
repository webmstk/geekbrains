require_relative 'user'
require_relative 'winery'

p User.new('Julie', '1996-07-22').years_old # => 19
p Winery.new('A Light Drop', '1954-08-01').years_old # => 61