class Array
  def my_each
    size.times do |i|
      yield(self[i])
    end
    self
  end
end

numbers = [1, 2, 3, 4, 5]
numbers.my_each { |element| puts element }
