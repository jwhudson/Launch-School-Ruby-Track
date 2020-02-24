
#--------Initialise Deck----------#

def initialise_deck
  new_deck = {}
  suits = [:Spade, :Club, :Heart, :Diamond]
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
  suits.each do |suit|
    new_deck[suit] = values
  end
  new_deck
end

#--------Deal Cards----------#

deck = initialise_deck
player_cards = []
dealer_cards = []

def deal(deck)
  suit = deck.keys.sample
  value = deck[suit].sample
  deck[suit].delete(value)
  [suit, value]
end

#--------Hand Values----------#

def hand_value(hand)
  value = 0
  arr = hand.flatten
  arr.each do |card|
    if card.class == Integer
      value += card
    elsif card == "J" || card == "Q" || card == "K"
      value += 10
    end
  end
  arr.each do |card|
    if card == "A"
      value += holding_ace?(value)
    end
  end
  value
end

def holding_ace?(value)
  ace_value = 0
  if value <= 10
    ace_value += 11
  else
    ace_value += 1
  end
  ace_value
end

#--------Gameplay----------#

def initial_deal(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deal(deck)
    dealer_hand << deal(deck)
  end
end

def player_turn(hand)
  loop do
    puts "Your hand is #{hand} with a value of #{hand_value(hand)}"
    puts "Hit or Stand?"
    choice = gets.chomp
    if choice.downcase == "stand"
      return false
    elsif choice.downcase == "hit"
      return true
    end
    puts "Please choose Stick or Stand"
  end
end

def dealer_turn(hand)
  hand_value(hand) >= 17 ? true : false
end

def bust?(value)
  value > 21 ? true : false
end

def winner(player_hand, dealer_hand)
  if bust?(hand_value(player_hand))
    puts "You are bust!"
    puts "Dealer wins!"
  elsif bust?(hand_value(dealer_hand))
    puts "Dealer is bust!"
    puts "You win!"
  elsif hand_value(player_hand) > hand_value(dealer_hand)
    puts "You Win!"
  elsif hand_value(dealer_hand) > hand_value(player_hand)
    puts "Dealer Wins!"
  else
    puts "It's a draw!"
  end
end

#--------Gameplay Loop----------#

puts "Welcome to 21!"

initial_deal(deck, player_cards, dealer_cards)

loop do
  puts "Dealer has the #{dealer_cards[0][1]} of #{dealer_cards[0][0]}'s and one other card."
  if player_turn(player_cards)
    player_cards << deal(deck)
  else
    break
  end
  break if bust?(hand_value(player_cards))
end

if !bust?(hand_value(player_cards))
  loop do
    if dealer_turn(dealer_cards)
      break
    else
      dealer_cards << deal(deck)
    end
  end
end

puts "Dealer has #{hand_value(dealer_cards)}."
puts "You have #{hand_value(player_cards)}."

winner(player_cards, dealer_cards)
