# 1  1  2  3  5  8  13  21  34  55
# 1  2  3  4  5  6  7   8   9   10

ROW = 8 # 21

# цикл

def fibonacci1(row)
  i = 3
  return 1 if row < i

  left = 1
  right = 1

  loop do
    sum = left + right

    left = right
    right = sum

    return sum if i == row
    i += 1
  end
end


# рекурсия

def fibonacci2(row, left = 1, right = 1)
  return 1 if row < 3
  row = row - 1

  sum = left + right
  sum = fibonacci2(row, right, sum) if row > 2
  sum
end


# ---------------------------------------
# а теперь красивые варианты из интернета

# цикл (круто!)

def fibonacci3(row)
  fbnc = [1, 1]
  (row - 2).times { |n| fbnc << fbnc[-2] + fbnc[-1] }
  fbnc.last
end


# рекурсия
# выглядит круто, но я не смог это распарсить в голове )

def fibonacci4(n)
  n <= 1 ? n :  fibonacci4(n - 1) + fibonacci4(n - 2)
end


p fibonacci1(ROW)
p fibonacci2(ROW)
p fibonacci3(ROW)
p fibonacci4(ROW)



# самый крутанский вариант!

def fib(index)
  a, b = 0, 1
  index.times do
    a, b = b, (a + b)
  end
  a
end

p fib(ROW)


# самый быстрый вариант

def fib_fast(index)
  a, b = 0, 1
  index.times do
    b = a + b
    a = b - a
  end
  a
end

p fib_fast(ROW)