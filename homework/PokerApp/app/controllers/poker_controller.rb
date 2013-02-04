class PokerController < ApplicationController


	def index


		suits = [	"spades", 
					"hearts", 
					"clubs", 
					"diamonds"]

		faces = [	"ace", 
				 	"king",
				 	"queen",
				 	"jack",
				 	"10",
				 	"9",
				 	"8",
				 	"7",
				 	"6",
				 	"5",
				 	"4",
				 	"3",
				 	"2"
				]


		cards = faces.product(suits)
		cards.shuffle!

		@hand = []

		for i in 0..4
			@hand.push(cards.pop)
		end

	end

end