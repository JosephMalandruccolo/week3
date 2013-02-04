class DiceController < ApplicationController


	#####################################
	# => CONSTANTS
	#####################################
	DICE_IMAGES = {
		1 => "http://www.cspp52553.com/assets/dice/1-b36fb198ac14ae04bfb7e33523a2e31f.png",
		2 => "http://www.cspp52553.com/assets/dice/2-7878d4727ff831d0f0fa666a92ff2e5e.png",
		3 => "http://www.cspp52553.com/assets/dice/3-936f42431c815fe03d71d53be2978404.png",
		4 => "http://www.cspp52553.com/assets/dice/4-442ac5b9f1847f716bc66acde44abc96.png",
		5 => "http://www.cspp52553.com/assets/dice/5-b15e66b5c33095bb694084fdf915eac2.png",
		6 => "http://www.cspp52553.com/assets/dice/6-99b93a547e350f887798cfc77d307b12.png"
	}

	WINNING_TEXT = "You win!"
	LOSING_TEXT = "You lose :-("
	PLAY_AGAIN = "Play again"
	ROLL_AGAIN = "Roll again"
	KEEP_ROLLING = "Keep rolling"
	HOME_PATH = "/dice"
	PLAY_PATH = "/dice/play"


	#####################################
	# => METHODS
	#####################################


	def index
	end


	#action the first time the player rolls
	def show

		dice_1 = Random.rand(1..6)
		dice_2 = Random.rand(1..6)
		sum = dice_1 + dice_2

		@dice_1_url = DICE_IMAGES[dice_1]
		@dice_2_url = DICE_IMAGES[dice_2]

		if sum == 7 or sum == 11
			@result = WINNING_TEXT
			@button_text = PLAY_AGAIN
			@link = HOME_PATH
		elsif sum == 2 or sum == 3 or sum == 12
			@result = LOSING_TEXT
			@button_text = PLAY_AGAIN
			@link = HOME_PATH
		else
			@result = sum.to_s + " is your point;" + " try to roll " + sum.to_s + " before you roll 7"
			@button_text = KEEP_ROLLING
			@link = PLAY_PATH + "?point=" + sum.to_s
		end


		render 'roll'
	end


	#action after the player rolls for the first time
	def play

		point = params[:point]
		point = point.to_i

		dice_1 = Random.rand(1..6)
		dice_2 = Random.rand(1..6)
		sum = dice_1 + dice_2

		@dice_1_url = DICE_IMAGES[dice_1]
		@dice_2_url = DICE_IMAGES[dice_2]

		if sum == 7
			@result = LOSING_TEXT
			@button_text = PLAY_AGAIN
			@link = HOME_PATH
		elsif sum == point
			@result = WINNING_TEXT
			@button_text = PLAY_AGAIN
			@link = HOME_PATH
		else
			@result = point.to_s + " is your point;" + " try to roll " + point.to_s + " before you roll 7"
			@button_text = KEEP_ROLLING
			@link = PLAY_PATH + "?point=" + point.to_s
		end


		render 'roll'
	end


end