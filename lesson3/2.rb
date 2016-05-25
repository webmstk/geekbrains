elements = %i/one two three four/

# не смоглось :)
def combination *array, group_size: 2
  array.combination(group_size).to_a
end


require 'benchmark'

Benchmark.bm(20) do |bm|
  bm.report 'Мой метод' do
    100000.times { combination :one, :two, :three, :four, group_size: 2 } # => 0.293271 (real)
  end

  bm.report 'Ruby метод' do
    100000.times { elements.combination(2).to_a } # => 0.223205 (real)
  end
end
