class String
  def -(str)
    delete str
  end
end

p ('Не прислоняться!' - 'пир') # => "Не слоняться!"
