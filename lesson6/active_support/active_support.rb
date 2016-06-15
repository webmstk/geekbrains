require 'active_support/all'

# Метод, превращающий хэш в объект класса ActiveSupport::HashWithIndifferentAccess

hash = ActiveSupport::HashWithIndifferentAccess.new
hash[:money] = 1_000_000
p hash[:money] # => 1000000
p hash['money'] # => 1000000

cars = { 'BMW': 'Germany', Toyota: 'Japan' }.with_indifferent_access
p cars.keys # => ["BMW", "Toyota"]


# Метод, возвращающий хэш без пар, ключи которых были переданы в качестве аргументов метода

hash = { aaa: 111, bbb: 222, ccc: 333, ddd: 444 }
odds = hash.extract!(:aaa, :ccc)
p odds # => {:aaa=>111, :ccc=>333}
p hash # => {:bbb=>222, :ddd=>444}

# Метод, превращающий хэш в строку запроса

query = { weight: :heavy, 'color' => 'green' }.to_param
puts query # => color=green&weight=heavy

item_query = { weight: :heavy, 'color' => 'green' }.to_query 'item'
puts item_query # => item%5Bcolor%5D=green&item%5Bweight%5D=heavy


# Метод, превращающий все ключи хэша в объекты класса String

hash = { passport: :international, luggage: :true }
hash.stringify_keys!
p hash # => {"passport"=>:international, "luggage"=>:true}


# Метод, возвращающий пустой хэш, если последний элемент массива не является хэшем и последний элемент массива в обратном случае

ar = ['rspec', 'capybara', database_cleaner: :false]
config = ar.extract_options!
p config # => {:database_cleaner=>:false}
p ar # => ["rspec", "capybara"]
p ar.extract_options! # => {}


# Метод, принимающий один аргумент и если этот аргумент является массивом, то он возвращается без изменений. В ином случае возвращается массив единственным элементом которого будет переданный аргумент

p Array.wrap('i want to be an array!') # => ["i want to be an array!"]
p Array.wrap(['i am already an array']) # => ["i am already an array"]


# Метод, возвращающий последние несколько элементов массива, начиная с индекса переданного в качестве аргумента

p [0, 1, 2, 3, 4, 5].from(2) # => [2, 3, 4, 5]
