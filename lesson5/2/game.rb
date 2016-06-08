require_relative 'dice/dice_game'
require_relative 'user'


user_1 = User.new 'Глаша'
user_2 = User.new 'Костя'

current_game = DiceGame.create user_1, user_2

user_1.bet score: 12, credits: 400
# user_1.bet score: 12, credits: nil
user_2.bet score: 7,  credits: 350
# user_2.bet score: 13,  credits: 350

current_game.turn

user_1.bet score: 6, credits: 1000
user_2.bet score: 7, credits: 3000

current_game.turn

current_game.finish