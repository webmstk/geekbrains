def print_head(head)
  puts "\n"
  puts head.center(20, '-')
end


print_head 'Hash'

hash = { color: :green, pages: 12 }

# Метод, принимающий блок и удаляющий пару, если условие внутри блока вычисляется в true
p hash.delete_if { |k, v| k == :pages && v < 20 } # => {:color=>:green}

# Метод, проверяющий пуст ли хэш
p hash.empty? # => false
p Hash.new.empty? # => true

# Метод, принимающий аргументы переменной длины, каждый из которых является ключом хэша
death = { island: { oak: { box: { rabbit: { duck: { egg: :needle } } } } } }
p death.dig(:island, :oak, :box, :rabbit, :duck, :egg) # => :needle
p death.dig(:island, :palm, :box, :rabbit, :duck, :egg)  # => nil


print_head 'Symbol'

# Метод, возвращающий массив всех определённых символов в памяти на данный момент
# p Symbol.all_symbols.sort # => [:"", :!, :!= ...]

# Метод, проверяющий находится ли зданное имя символа между двумя другими заданными именами символов
p :bbb.between?(:aaa, :ccc) # => true
p :bbb.between?(:ddd, :eee) # => false


print_head 'File'

# Метод, превращающий путь к файлу в его абсолютный путь
p File.absolute_path('files/file') # => "/Users/etalord/www/geekbrains/files/file"

# Метод проверяющий, является ли данный файл каталогом
p File.directory?('files') # => true
p File.directory?('files/file') # => false

# Метод проверяющий существование файла
p File.exist?('files') # => true
p File.exist?('files/file') # => true
p File.exist?('files/file2') # => false

# Метод возвращающий время модификации файла
p File.mtime('files/file') # => 2016-05-22 11:57:48 +0300


print_head 'Time'

# Метод, возвращающий текущее время
p Time.new # => 2016-05-22 12:11:19 +0300
p Time.now # => 2016-05-22 12:11:19 +0300

# Метод, проверяющий пятница ли сегодня
p Time.new(2016, 5, 22).friday? # => false
p Time.new(2016, 5, 20).friday? # => true

# Метод, возвращающий строку с названием часового пояса
p Time.now.zone # => "MSK"


print_head 'Kernel'

# Метод, возволяющий исполнять любой Ruby код, переданный в качестве строки
eval 'p 1 + 3' # => 4

# Метод, позволяющий приостановить работу программы на определённое количество секунд
puts Time.now.strftime '%H:%M:%S' # => 12:33:43
sleep 3
puts Time.now.strftime '%H:%M:%S' # => 12:33:46
