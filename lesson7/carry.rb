divide = Proc.new { |a, b| (a % b).zero? }

100.times do |i|
  i += 1
  text = i

  divided_by = divide.curry.call(i)
  divided_by_3 = divided_by.call(3)
  divided_by_5 = divided_by.call(5)


  if divided_by_3 && divided_by_5
    text = 'FizzBuzz'
  elsif divided_by_3
    text = 'Fizz'
  elsif divided_by_5
    text = 'Buzz'
  end

  p text
end
