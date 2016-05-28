### Задания к занятию 4

* Создание объектов
* Метод-конструктор
* Определение поведения (методов) и состояния (переменных экземпляра) объекта
* Доступ к переменным экземпляра за пределами области видимости объекта
* Объектная модель Ruby
* Контекст выполнения программы
* Ключевое слово `self`
* Этапы проектирования класса



#### Этапы проектирования класса

Программные классы по сути являются типом данных. Если мы можем нужную нам сущность из реального мира описать с помощью уже существующих типов данных в языке программирования, то можно вполне обойтись и без создания класса.

Например, массив целых чисел. Ясно что в Ruby мы вполне можем использовать уже существующий класс `Array`. А вот для представления точек, или отчёта, позиций в интернет магазине или автомобилей в автосалоне классы нам очень пригодятся, поскольку поведение этих сущностей достаточно сложное и существующих классов Ruby для нас уже не достаточно.

Итак, **первый этап** проектирования класса - **разобраться и проанализировать текущую задачу**. Спросите себя, с какими данными вы работаете? Какие объекты существуют и как они взаимодействуют? Сколько таких объектов может существовать? Выстраиваются ли они в иерархию или являются полностью независимыми друг от друга?

Каждая такая сущность или объект логично описывается с помощью класса. Например, для приложения по продаже автомобилей это могут быть:

```ruby
# Класс для представления автомобиля
class Vehicle
end

# Класс для представления пользователя
class User
end

# Класс для представления клиента
class Client < User
end

# Класс для представления заказа на автомобиль
class VehicleOrder
end
```
После того как вы определили классы, время для **второго этапа - определения поведения объектов (которые будут созданы из описанных классов)**. Инымы словами, необходимо описать методы. Пусть сейчас это будут пустые методы, но вы уже имеете представление о том, что эти методы будут делать, то есть как объект будет себя вести и что уметь.

Например, объекты класса `Vehicle` вполне могут обладать методами:

```ruby
class Vehicle

  # Метод, возвращающий итоговую цену на автомобиль
  #   это может быть и переменная экземпляра, но может быть и метод,
  #   если цена вычисляется на основе нескольких показателей
  def final_price
  end

  # Метод возвращающий состояние в котором находится автомобиль
  #   например: забронирован, тест-драйв, продан, подготовка
  def status
  end

end
```

Далее **третий этап - определения состояния объекта (то есть переменных экземпляра)**. Здесь необходимо спросить себя о том, какие данные могут быть у определённого объекта? Что может происходить с этими данными? Как они изменяются? Где могут храниться?

Например, объекты класса `User`, представляющие всех пользователей в приложении, могут иметь такие свойства как *имя*, *фамилия*, *электронная почта*, *роль*, *последнее использование приложения*:

```ruby
class User

  def initialize data = {}
    @first_name    = data[:first_name]
    @last_name     = data[:last_name]
    @email         = data[:email]
    @role          = data[:role]
    @last_visit_at = Time.now
    @auth_token    = nil
  end

end
```

На этом же этапе описывается конструктор - метод `initialize`. **Обратите внимание**, даже если вы не используете какую-либо переменную экземпляра сразу (как `@auth_token`), но будете устанавливать её значение позже, всё равно полезно эту переменную в конструкторе описать, чтобы было понятно что такая переменная в принципе есть, пусть и инициализируется позже.

Наконец, **четвёртый этап - описание созданных методов**. Здесь мы уже пишем логику для конкретных методов для того, чтобы наши идеи заработали полностью.

Резюмируем этапы создания классов:

1. Анализ задачи и выделение сущностей из реального мира
2. Описание поведения объекта (методов)
3. Описание состояния объекта (переменных экземпляра)
4. Описание логики методов (непосредственно код методов)



#### 1. Методы Ruby Std-lib API

Найдите в документации Ruby по адресу http://ruby-doc.org/stdlib-2.3.0/ методы для объектов разных классов. Поэкспериментируйте с ними в интерактивной оболочке `irb` или `pry`. Для установки `pry` используйте команду:

```
gem install pry
```

Дополнительную информацию о возможностях `pry` можно посмотреть здесь: http://pryrepl.org/

Ruby обладает достаточно большой стандартной библиотекой. Стандартная библиотека - это набор модулей и классов, которые по умолчанию не загружаются в память при старте программы, но поставляются вместе с самим интерпретатором. Иными словами, чтобы использовать стандартную библиотеку скачивать дополнительно ничего не нужно, но необходимо нужную библиотеку подключить.

Это возможно с помощью метода `require`. Например, чтобы подключить библиотеку для работы с вещественными числами без потери точности мы используем [BigDecimal](http://ruby-doc.org/stdlib-2.3.0/libdoc/bigdecimal/rdoc/BigDecimal.html). Для подключения данной стандартной библиотеки необходимо первой строчкой в исходном коде вашей программы написать:

```ruby
require 'bigdecimal'
```

Либо вызвать этот же метод в `irb` или `pry`. Точно также необходимо действовать при использовании остальных модулей и классов из стандартной библиотеки Std-lib.

Может возникнуть вопрос: почему Std-lib не загружается сразу в память при выполнении программы, ведь так или иначе, стандартная библиотека поставляется вместе с интерпретатором? Ответ такой: если бы Std-lib загружалась сразу, программа занимала бы довольно большой объём памяти при учёте того, что б*о*льшая часть Std-lib может и не использоваться вовсе.

Итак, отправляемся на поиски методов:

Для модуля `Base64`:

* Методы модуля для кодирования/декодирования строки в base64

Для модуля `Benchmark`:

* Метод модуля, принимающий блок и вычисляющий время его выполнения

Для модуля `Find`:

* Метод модуля для рекурсивного обхода дерева каталогов относительно имени заданного каталога (передаётся в качестве аргумента)

Для класса `Digest::MD5`:

* Метод класса, вычисляющий md5 хэш от строки

Для модуля `Timeout`:

* Метод модуля, выкидывающий исключение, если код исполняемый в блоке вычисляется более N секунд



#### 2. Моделирование реальности

Подумайте над любой задачей из реального мира, определите сущность из этой задачи и опишите её с помощью класса. Желательно чтобы в классе было:

* Метод-конструктор `initialize`

* Переменные экземпляра

* Способность обращаться к переменным экземпляра за пределами области видимости объекта

* Метод `to_s` который будет переопределять такой же метод из класса `Object` и представлять ваш объект в строковом виде. Например, вы можете вывести словесное название объекта и его переменные экземпляра

* Пара методов, реализующих какое-либо поведение объекта



#### 3. Дополнительное поведение класса `Point`

* Добавьте метод `similar_quarter?` для проверки того, лежат ли обе точки в одной четверти координатной плоскости. Метод должен возвращать `true` или `false`

* Метод проверяющий лежит ли точка в начале координат

* Метод, устанавливающий точку в начало координат

* Метод `+` для сложения двух объектов класса `Point`



#### 4. Методы сравнения для класса `Point`

Подмешайте в класс `Point` модуль `Comparable` для получения методов сравнения. Чтобы получить возможность сравнивать объекты класса `Point` на основе их расстояния от начала координат, в классе `Point` необходимо определить метод `<=>`. Он должен возвращать `-1`, если первая точка ближе к началу координат, чем вторая, `1` – если она дальше и `0` – если расстояние от начала координат до каждой из точек одинаково.

Метод `<=>` также должен возвращать `nil`, если аргумент не является объектом класса `Point`.

Затем просто подключите модуль `Comparable`, и вы получите методы сравнения. Это позволит вычислить такое выражение:

```ruby
class Point

  include Comparable

  def initialize x:, y:
    @x = x
    @y = y
  end

  def <=> other_point
    # TODO: Заставь меня работать!
  end

end

Point.new(x: 1, y: 2) < Point.new(x: 3, y: 4) # => true
```



#### 5. Вычисление площади и периметра

Напишите класс `Rectangle` для вычисления периметра и площади прямоугольника.

Класс `Rectangle` должен реализовывать 2 метода: `Rectangle#area` и `Rectangle#perimeter` — для вычисления площади и периметра соответственно.

`Rectangle::new` принимает 2 аргумента, каждый из которых — экземпляр класса `Point`. Таким образом, прямоугольник задаётся двумя вершинами (левая верхняя и правая нижняя).

```ruby
class Rectangle

  def initialize start_point, end_point
    @start_point = start_point
    @end_point   = end_point
  end

  def area
    # TODO: Вычисли площадь
  end

  def perimeter
    # TODO: Вычисли периметр
  end

end

ground = Rectangle.new(Point.new(x: 1, y: 1), Point.new(x: 10, y: 10))

ground.area
ground.perimeter
```

Стоит иметь в виду, что при работе с координатами, как правило, начало координат находится в левом верхнем углу экрана. Положительная ось x проходит слева направо в верхней части экрана, положительная ось y проходит сверху вниз по левой стороне экрана:

![2D coordinates](http://programarcadegames.com/chapters/05_intro_to_graphics/Computer_coordinates_2D.png)