require 'rubygems'
require 'pry'

require_relative 'game'
require_relative 'player'
require_relative 'deck'

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

me = Card.new("Hearts", "6")
puts me.id