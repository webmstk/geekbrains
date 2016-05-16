names = %w[ambientsketchbook Erik\ Wollo Brian\ Eno Evangelos\ Papathanassiou Shulman]

# Вариант 1

def capitalized?(str)
  str[0] == str[0].upcase
end

def short?(str)
  str.length < 10
end

names.each do |name|
  puts name if capitalized?(name) && short?(name)
end


# Вариант 2

class String
  def capitalized?
    chr == chr.upcase
  end

  def short?(chars = 10)
    length < chars
  end
end

names.each do |name|
  puts name if name.capitalized? && name.short?
end