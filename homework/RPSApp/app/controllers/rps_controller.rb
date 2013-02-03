class RpsController < ApplicationController

	###########################################
	# => constants
	###########################################
	WINNING_TEXT = "You win!"
	LOSING_TEXT = "You lose :-("
	DRAW_TEXT = "draw"


	###########################################
	# => methods
	###########################################

	#first page, shows player all options
	def index
		@moves = Move.all
	end


	#method called after a player selects his move, shows the result
	def show

		#get the player's and opponent's move data
		@move = Move.find_by_item(params[:item])
		random = Random.new.rand(1..3)
		@opponent = Move.find_by_id(random)

		#logic to determine winner
		case @move.item
		when "rock"
			if @opponent.item == "scissors"
				@result = WINNING_TEXT
			elsif @opponent.item == "paper"
				@result = LOSING_TEXT
			else
				@result = DRAW_TEXT
			end
		when "scissors"
			if @opponent.item == "scissors"
				@result = DRAW_TEXT
			elsif @opponent.item == "paper"
				@result = WINNING_TEXT
			else
				@result = LOSING_TEXT
			end
		when "paper"
			if @opponent.item == "scissors"
				@result = LOSING_TEXT
			elsif @opponent.item == "paper"
				@result = DRAW_TEXT
			else
				@result = WINNING_TEXT
			end
		else
			@result = "ERROR"
		end

		render "result"
	end


end