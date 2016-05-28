# Задача - подсчёт количества оставшихся очков при игре в дартс

class Darts
  CONSOLE_SPACES = 7

  def initialize total = 301
    @total = total
    @players = []
    @current_player_index = 0
  end

  def add_player name
    @players.push Player.new(name, @total)
  end

  def shuffle_players
    @players.shuffle!
  end

  def start
    @current_player ||= @players.first
    puts @players.join(' ' * CONSOLE_SPACES)
  end

  def hit points
    @current_player.hit points
  end

  def next_player
    @current_player_index = last_player? ? 0 : @current_player_index.next
    @current_player = @players[@current_player_index]

    next_player if @current_player.winner?
  end

  def status
    @players.each do |player|
      text = player.status
      player.clear_status if text == :win

      shift = (player.name.length - text.length) + CONSOLE_SPACES
      print text.to_s + ' ' * shift
    end

    puts "\n"
  end

  def over
    puts "\n"
    puts 'Победила дружба! :)'
    puts "\n"
  end

  private

    def last_player?
      @current_player == @players.last
    end
end


class Player
  attr_reader :name, :status
  attr_accessor :score

  def initialize name, score
    @name = name
    @score = score
    @status = @score.to_s
    @winner = false
  end

  def hit points
    delta = @score - points

    if delta.positive?
      @score -= points
      @status = @score.to_s
    elsif delta.zero?
      @status = :win
      @winner = true
    else
      @status = :-
    end
  end

  def winner?
    @winner
  end

  def clear_status
    @status = :''
  end

  def to_s
    name
  end
end


game = Darts.new
game.add_player 'Вася'
game.add_player 'Петя'
game.add_player 'Наташа'
game.shuffle_players # optional

game.start
game.status

game.hit 130
game.next_player
game.hit 178
game.next_player
game.hit 102
game.next_player
game.status

game.hit 145
game.next_player
game.hit 92
game.next_player
game.hit 55
game.next_player
game.status

game.hit 100
game.next_player
game.hit 31
game.next_player
game.hit 13
game.next_player
game.status

game.hit 40
game.next_player
game.hit 100
game.next_player
game.status

game.hit 3
game.next_player
game.hit 11
game.next_player
game.status

game.hit 7
game.next_player
game.hit 20
game.next_player
game.status

game.over