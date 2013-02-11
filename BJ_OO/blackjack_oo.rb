require 'rubygems'
require 'pry'
		
class Game
	attr_accessor :p1_name, :game_deck, :player1, :dealer

	def initialize()
		puts ""
		puts "Welcome to Blackjack!"
		puts ""
		puts "What is your name?"
		@p1_name = gets.chomp
		puts ""
		@game_deck = Deck.new
		@player1 = Player.new(p1_name)
		@dealer = Player.new("Dealer")
		run_game
	end

	def run_game()
		puts "Ok #{player1.name}, let's do this."
		puts ""

		deal(player1, true, true)
		deal(dealer, true, true)

		deal(player1, true, true)
		deal(dealer, true, true)

		compare_value(player1, dealer)

	end

	def deal(player, show_c, show_v)
		player.hand << deal_card
		player.deal_count += 1
		
		if show_c
			puts "Card #{player.deal_count+1} for #{player.name}: #{player.hand[player.deal_count].face_value} of #{player.hand[player.deal_count].suit}."
		end
		
		card_valuer(player, show_v)
	end

	def hit_or_stay
	end

	def card_valuer(player, show)
		array = player.hand.map{|x| x.face_value}

		cards_val = 0
		array.each do |val|
			if val == "A"
				cards_val += 11
			elsif val.to_i == 0 #This picks up J, K, Q
				cards_val += 10
			else
				cards_val += val.to_i
			end
		end

		player.hand_total = cards_val

		if show
			puts "#{player.name} Total: #{cards_val}"
		end
	end

	def compare_value(player, dealer)
		if player.hand_total == 21 && dealer.hand_total != 21
			puts "You've got Blackjack!"
		elsif player.hand_total == 21 && dealer.hand_total == 21
			puts "It's a draw."
		elsif player.hand_total > 21
			puts "You bust."
		elsif dealer.hand_total > 21 && player.hand_total <= 21
			puts "Dealer busts, you win!"
		elsif player.hand_total > dealer.hand_total && player.hand_total <= 21
			puts "You win!"
		elsif dealer.hand_total > player.hand_total && dealer.hand_total <= 21
			puts "Dealer wins."
		else
			puts "We'll need to add a condition for this."
		end
	end
	
	def deal_card
		game_deck.cards.pop
	end

end

class Player
	attr_accessor :name, :hand, :deal_count, :hand_total

	def initialize(name)
		@name = name
		@hand = []
		@deal_count = -1
		@hand_total = 0
	end
end

class Deck
	attr_accessor :cards

	def initialize()
		@cards = []
		["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |fv|
			["Hearts", "Clubs", "Diamonds", "Spades"].each do |s|
				@cards << Card.new(s, fv)
			end
		end
		cards.shuffle!
	end

	def deal_card
		cards.pop
	end
end

class Card
	attr_accessor :suit, :face_value

	def initialize(s, fv)
		@suit = s
		@face_value = fv
	end

	def id
		puts "This is a #{face_value} of #{suit}"
	end
end

new_game = Game.new
new_game