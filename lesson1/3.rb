results = [10, 2, 5, 12, 11, 11, 4]

puts 'Количество очков по партиям'
puts '==========================='

round = 0
for sum in results
  round = round.next
  puts "Партия: #{round} / Выпало очков: #{sum}"
end