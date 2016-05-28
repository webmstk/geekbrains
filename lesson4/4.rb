class Point

  include Comparable

  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def <=> point
    # sum1 = x.abs + y.abs
    # sum2 = point.x.abs + point.y.abs
    #
    # if sum1 < sum2
    #   -1
    # elsif sum1 > sum2
    #   1
    # else
    #   0
    # end
    
    # piggyback on Fixnum's <=>
    x.abs + y.abs <=> point.x.abs + point.y.abs
  end

end

a = Point.new -10, -20
b = Point.new 15, 5

p a < b # => false