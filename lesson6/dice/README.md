Game example

```
require_relative 'dice/dice_game'
require_relative 'dice/user'


user_1 = User.new 'Глаша'
user_2 = User.new 'Костя'

current_game = DiceGame.create user_1, user_2

user_1.bet score: 12, credits: 400
user_2.bet score: 7,  credits: 350

current_game.turn

current_game.finish
```
