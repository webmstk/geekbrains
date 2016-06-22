
# 1

origin = [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4]

def maximum_sequence arr
  size = arr.size
  return arr if size < 2

  max = arr.min
  sequence = []

  2.upto size do |length|
    start = 0

    (size - length + 1).times do
      sum = arr[start, length].inject :+

      if sum > max
        max = sum
        sequence = [start, length]
      end

      start += 1
    end
  end

  arr.slice *sequence
end

p maximum_sequence(origin) # => [4, -1, 2, 1]




# 2

origin = [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4]

def maximum_sequence arr
  size = arr.size
  return arr if size < 2

  mega_array = []

  2.upto size do |length|
    arr.each_cons(length) do |cons|
      mega_array << cons
    end
  end

  sub_ar = mega_array.first
  mega_array.reduce(sub_ar.reduce :+) do |memo, ar|
    sum = ar.reduce :+
    memo > sum ? memo : (sub_ar = ar; sum)
  end

  sub_ar
end

p maximum_sequence(origin) # => [4, -1, 2, 1]




# 3 best

origin = [-1, -13, -2, 1, -3, 4, -1, 2, 1, -5, 4]

def maximum_sequence arr, min_sequence_size = 2
  size = arr.size
  return arr if size <= min_sequence_size

  max = arr.min
  sequence = []

  min_sequence_size.upto size do |length|
    arr.each_cons(length).with_index do |cons, start|
      sum = cons.inject :+

      if sum > max
        max = sum
        sequence = [start, length]
      end
    end
  end

  arr.slice *sequence
end

p maximum_sequence(origin) # => [4, -1, 2, 1]
