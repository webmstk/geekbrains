require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'just_for_fun.sqlite3')

unless ActiveRecord::Base.connection.data_source_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :name
    t.string :last_name
    t.integer :age
    t.boolean :knows_ruby, default: false
  end
end


class User < ActiveRecord::Base

end


User.create name: 'Федор', last_name: 'Тыщенко', age: 44, knows_ruby: true
User.create name: 'Марина', last_name: 'Белова', age: 23
User.create name: 'Евгений', last_name: 'Фатеев', age: 23, knows_ruby: true
User.create name: 'Алла', last_name: 'Желудь', age: 44
User.create name: 'Павел', last_name: 'Бакун', age: 19, knows_ruby: true



# Выбрать запись из базы данных по её уникальному идентификатору (первичному ключу)
p User.find(User.second.id) # => #<User id: 2, name: "Марина", last_name: "Белова", age: 23, knows_ruby: false>


# Выбрать n записей из базы данных
p User.take 2 # => [#<User id: 1, name: "Федор", last_name: "Тыщенко", age: 44, knows_ruby: true>, #<User id: 2, name: "Марина", last_name: "Белова", age: 23, knows_ruby: false>]


# Выбрать первую запись, удовлетворяющую определённым условиям (условия передаются в качестве аргумента метода в виде хэша)
p User.find_by age: 23 # => #<User id: 2, name: "Марина", last_name: "Белова", age: 23, knows_ruby: false>


# Выбрать все записи из таблицы, однако по n штук за один SQL запрос
p User.find_each(batch_size: 3).map(&:name).join ', ' # => "Федор, Марина, Евгений, Алла, Павел"


# Выбрать все записи, удовлетворяющие определённым условиям (условия передаются в качестве аргумента метода в виде хэша)
p User.where(age: 18..30, knows_ruby: true) # => #<ActiveRecord::Relation [#<User id: 41, name: "Евгений", last_name: "Фатеев", age: 23, knows_ruby: true>, #<User id: 43, name: "Павел", last_name: "Бакун", age: 19, knows_ruby: true>]>


# Выбрать записи в определённом порядке
p User.order(:last_name).map(&:last_name).join ', ' # => "Бакун, Белова, Желудь, Тыщенко, Фатеев"


# Получить массив со значениями для определённой колонки для строк из таблицы в базе данных
p User.pluck :age # => [44, 23, 23, 44, 19]


# Сохранить модель в базе данных
user = User.new name: 'Натша', last_name: 'Родионова'
user.save!
p User.last # => #<User id: 11, name: "Натша", last_name: "Родионова", age: nil, knows_ruby: false>


# Обновить данные модели в базе данных
user.update! name: 'Наташа', age: 27
p User.last # => #<User id: 11, name: "Наташа", last_name: "Родионова", age: 27, knows_ruby: false>


# Удалить модель из базы данных
user.destroy!
p user      # => #<User id: 11, name: "Наташа", last_name: "Родионова", age: 27, knows_ruby: false>
p user.persisted? # => false


# Проверить, существует ли в базе данных модель с определёнными условиями
p User.exists? name: 'Наташа' # => false
p User.exists? name: 'Алла' # => true


# Удалить все строки из таблицы в базе данных для определённой модели
User.destroy_all
p User.count # => 0
