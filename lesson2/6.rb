cypher = 'Lbh unpxrq n irel frperg zrffntr!'
# cypher = 'You hacked a very secret message!'


# map

def rot13_1(cypher)
  cypher.split('').map do |char|
    case char
      when 'a'..'m', 'A'..'M'
        char.ord + 13
      when 'n'..'z', 'N'..'Z'
        char.ord - 13
      else
        char.ord
    end.chr
  end.join('')
end

p rot13_1(cypher)


# inject

def rot13_2(cypher)
  cypher.split('').inject('') do |text, char|
    text << case char
      when 'a'..'m', 'A'..'M'
        char.ord + 13
      when 'n'..'z', 'N'..'Z'
        char.ord - 13
      else
        char.ord
    end
  end
end

p rot13_2(cypher)


# lol

def rot13_3(cypher)
  cypher.tr('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
            'nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM')
end

p rot13_3(cypher)


def rot13_4(cypher)
  cypher.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

p rot13_4(cypher)


# Отдохнули? Продолжим!
# У губ твоих конфетных конфетный вкус...

# String implementation (inject)

class String
  def rot13
    split('').inject('') do |text, char|
      text << case char
        when 'a'..'m', 'A'..'M'
          char.ord + 13
        when 'n'..'z', 'N'..'Z'
          char.ord - 13
        else
          char.ord
      end
    end
  end
end

p cypher.rot13