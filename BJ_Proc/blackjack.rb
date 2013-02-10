# Setup deck

value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
suit = ["Hearts", "Clubs", "Diamonds", "Spades"]

deck = value.product(suit)
deck.shuffle!

# Setup card valuer

def card_valuer(cards)
	array = cards.map{|x| x[0]}

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

	cards_val
end

# Deal the first hand

puts "Welcome to BlackJack"
puts ""

mycards = []
mycards << deck.pop
mycards << deck.pop

dealcards = []
dealcards << deck.pop
dealcards << deck.pop

mytotal = card_valuer(mycards)
dealtotal = card_valuer(dealcards)

puts "Your first card is #{mycards[0]}"
puts ""
puts "Your second card is #{mycards[1]}"
puts ""

# Hit or Stay?

puts "Would you like to 1) Hit or 2) Stay?"
puts ""

hit_or_stay = gets.chomp
puts ""

if hit_or_stay == "1"
	while hit_or_stay == "1"
		puts "Have a card!"
		puts ""
		mycards << deck.pop
		puts "It is #{mycards[2]}"
		puts ""
		card_valuer(mycards)
		if mytotal > 21
			puts "You bust :("
			next
		end
		puts "Would you like to 1) Hit or 2) Stay?"
		puts ""
		hit_or_stay = gets.chomp
		puts ""
	end

elsif hit_or_stay == "2"
	puts "Ok, you have " + mytotal.to_s + " let's see what the dealer has."
	puts ""
	puts "The dealer has " + dealtotal.to_s + "."
	puts ""

	if mytotal > dealtotal && mytotal <= 21
		puts "You win :)"
		puts ""
	elsif mytotal == dealtotal
		puts "It's a draw :|"
		puts ""
	else
		puts "The dealer wins :("
		puts ""
	end
else
	puts "You can only enter 1 or 2. Ciao."
	puts ""
end

		

		
