class Point

  attr_accessor :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def similar_quarter? point
    # return false if [x, y, point.x, point.y].any? &:zero?
    # x.positive? == point.x.positive? && y.positive? == point.y.positive?

    (x.zero? || point.x.zero? || x.positive? == point.x.positive?) &&
    (y.zero? || point.y.zero? || y.positive? == point.y.positive?)
  end

  def center?
    x.zero? && y.zero?
  end

  def center!
    @x, @y = 0, 0
  end

  def to_s
    "Point: (#{@x}; #{@y})"
  end

  def + point
    Point.new(@x + point.x, @y + point.y)
  end

end

a = Point.new 1, 21
b = Point.new 5, 25


# similar_quarter?

c = Point.new -5, 25
d = Point.new 5, -25
e = Point.new -5, -25
f = Point.new 0, 25
i = Point.new 0, 0

p a.similar_quarter? b # => true
p a.similar_quarter? c # => false
p a.similar_quarter? d # => false
p a.similar_quarter? e # => false
p a.similar_quarter? f # => true
p a.similar_quarter? i # => true


# center?

g = Point.new 0, 0

p g.center? # => true
p a.center? # => false


# center!

h = Point.new 5, 12
h.center!
puts h # => Point: (0; 0)


# +
puts a + b # => Point(6; 46)