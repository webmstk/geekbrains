player = { name: 'Бармалей', color: :green }

def player.to_s
  fetch :name
end

colors = [:blue, :white, :green, :red, :orange]
color = colors.sample

if color == player[:color]
  print "#{player}, ты прав!"
elsif color.length == player[:color].length
  print "#{player}, букв столько же, но значение иное!"
else
  print "Думай, #{player}, думай!"
end