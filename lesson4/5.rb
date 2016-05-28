class Point

  attr_accessor :x, :y

  def initialize x: 0, y: 0
    @x = x
    @y = y
  end

end


class Rectangle

  def initialize start_point, end_point
    @start_point = start_point
    @end_point   = end_point
    # raise 'Incorrect point order' if side_x.negative? || side_y.negative?
  end

  def area
    side_x * side_y
  end

  def perimeter
    side_x * 2 + side_y * 2
  end


  private

    def side_x
      (@end_point.x - @start_point.x).abs
    end

    def side_y
      (@end_point.y - @start_point.y).abs
    end
end

ground = Rectangle.new(Point.new(x: 1, y: 1), Point.new(x: 10, y: 10))

p ground.area # => 81
p ground.perimeter # => 36