### Задания к занятию 3

* Определение и вызов методов
* Параметры и аргументы
* Возвращаемое значение
* Объектно-Ориентированное Программирование
* Определение собственных типов данных (классов)



#### 1. Методы Ruby Core API

Найдите в документации Ruby по адресу http://ruby-doc.org/core/ методы для объектов разных классов. Поэкспериментируйте с ними в интерактивной оболочке `irb`

Для класса `Hash`:

* Метод, принимающий блок и удаляющий пару, если условие внутри блока вычисляется в `true`

* Метод, проверяющий пуст ли хэш

* Метод, принимающий аргументы переменной длины, каждый из которых является ключом хэша. Если удаётся последовательно получить значение для каждого из ключей, возвращается это значение. Если нет - возвращается `nil`. Трудно объяснить метод словами, поэтому ниже пример:

```ruby
storage = { data: { name: 'John' } }
storage.<method>(:data, :name) # => 'John'
storage.<method>(:data, :age)  # => nil
```

Для класса `Symbol`:

* Метод, возвращающий массив всех определённых символов в памяти на данный момент

* Метод, проверяющий находится ли зданное имя символа между двумя другими заданными именами символов. Между – имеется в виду проверка по кодам ASCII для символов из которых состоит объект класса `Symbol`

Для класса `File`:

* Метод, превращающий путь к файлу в его абсолютный путь

* Метод проверяющий, является ли данный файл каталогом

* Метод проверяющий существование файла

* Метод возвращающий время модификации файла

Для класса `Time`:

* Метод, возвращающий текущее время

* Метод, проверяющий пятница ли сегодня

* Метод, возвращающий строку с названием часового пояса

Для модуля `Kernel`:

* Метод, возволяющий исполнять любой Ruby код, переданный в качестве строки

* Метод, позволяющий приостановить работу программы на определённое количество секунд



#### 2. Сколько здесь вариантов?

Напишите метод `combination` для поиска [сочетаний] в массиве элементов. Сравните производительность метода с одноимённым методом Ruby из класса `Array` при помощи модуля `Benchmark`. Пример:

```ruby
elements = [:one, :two, :three, :four]
combination elements, 2 # => [[:one, :two], [:one, :three], [:one, :four], [:two, :three], [:two, :four], [:three, :four]]
```

В качестве дополнительной тренировки модифицируйте ваш метод таким образом, чтобы он принимал переменное количество аргументов:

```ruby
combination :one, :two, :three, :four, group_size: 2
```



#### 3. Собственный тип данных

Подумайте над любой задачей из реального мира, определите сущности и попробуйте представить их с помощью типов данных Ruby. Для каких сущностей вы определили собственные классы и почему?



#### 4. ООП в движении

Понаблюдайте и попробуйте описать (в виде свободного текста) процесс взаимодействия между объектами по аналогии с примером продавца. Постарайтесь чётко обозначить какие объекты участвуют во взаимодействии, каким поведением (методами) они обладают и каким состоянием (данными), какие методы вызываются в процессе взаимодействия.



<!-- Links -->

[сочетаний]: https://ru.wikipedia.org/wiki/Сочетание
