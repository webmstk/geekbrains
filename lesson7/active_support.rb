require 'active_support/all'

# Numeric

# Метод, возвращающий объект класса ActiveSupport::Duration, представляющий n часов, n минут, n секунд
p 2.hours # => 7200 seconds
p 5.minutes # => 300 seconds
p 1.second # => 1 second

# Метод, возвращающий экземпляр класса Time, со значением времени через n секунд от текущего момента
p 5.seconds.from_now # => 2016-06-21 20:21:38 +0300

# Метод, возвращающий экземпляр класса Time, со значением времени n секунд тому назад от текущего момента
p 5.seconds.ago # => 2016-06-21 20:21:28 +0300


# String

# Метод, возвращающий константу по имени строки
p 'Class' # => "Class"
p 'Class'.constantize # => Class
'sasdf'.constantize rescue p 'no constant' # => "no constant"


# Метод, возвращающий множественное число для значения строки
puts 'song'.pluralize # => songs

# Метод, возвращающий строку без подстрок совпавших по шаблону который передан в метод в качестве аргумента
p 'валидол кокаин парацетамол'.remove ' кокаин' # => "валидол парацетамол"

# Метод, проверяющий, стостоит ли строка лишь из пробельных символов
p '     '.blank? # => true
p ' x y z '.blank? # => false

# Метод, заменяющий символ _ на -
puts 'чунга_чанга'.dasherize # =>  чунга-чанга


# ActiveSupport::Configurable

# Метод для доступа к упорядоченному хэшу, хранящему конфигурацию (пользовательские настройки) для класса
class GeekBrains
  include ActiveSupport::Configurable
end

courses = GeekBrains.new
courses.config.lesson = 7
p courses.config.lesson # => 7
