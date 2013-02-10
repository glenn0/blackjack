# Interactive command line blackjack game


def calculate_total(cards) 
# [['H', '3'], ['S', 'Q'], ... ]
  
end

puts "Welcome to Blackjack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""
puts "What would you like to do? 1) hit 2) stay"
hit_or_stay = gets.chomp


