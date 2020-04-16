# # Question 1

# def decrease(counter)
#   counter - 1
# end

# counter = 10

# counter.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'

# # Question 2

# def shout_out_to(name)
#   puts 'HEY ' + name.upcase
# end

# shout_out_to('you') # expected: 'HEY YOU'

# # Question 3

# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count == 3
# end

# p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# # Question 4

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed_words = []

#   i = 0
#   while i < words.length
#     reversed_words.unshift(words[i])
#     i += 1
#   end

#   reversed_words.join(' ')
# end

# p reverse_sentence('how are you doing')
# # expected output: 'doing you are how'

# # Question 5

# cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = { :hearts   => cards.clone,
#         :diamonds => cards.clone,
#         :clubs    => cards.clone,
#         :spades   => cards.clone }

# def score(card)
#   case card
#   when :ace   then 11
#   when :king  then 10
#   when :queen then 10
#   when :jack  then 10
#   else card
#   end
# end

# # Pick one random card per suit

# player_cards = []
# deck.keys.each do |suit|
#   cards = deck[suit]
#   cards.shuffle!
#   player_cards << cards.pop
# end

# # Determine the score of the remaining cards in the deck

# sum = deck.reduce(0) do |sum, (_, remaining_cards)|
#   scores = remaining_cards.map do |card|
#     score(card)
#   end

#   sum += scores.sum
# end

# puts sum

# # Question 6

# def move(n, from_array, to_array)
#   return if n == 0
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# # Example

# todo = ['study', 'walk the dog', 'coffee with Tom']
# done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# # Question 7

# def neutralize(sentence)
#   words = sentence.split(' ')
#   positive_words = []
#   words.each do |word|
#     positive_words << word unless negative?(word)
#   end

#   positive_words.join(' ')
# end

# def negative?(word)
#   [ 'dull',
#     'boring',
#     'annoying',
#     'chaotic'
#   ].include?(word)
# end

# puts neutralize('These dull boring cards are part of a chaotic board game.')
# # Expected: These cards are part of a board game.
# # Actual: These boring cards are part of a board game.

# # Question 8



# def set_password
#   puts 'What would you like your password to be?'
#   new_password = gets.chomp
#   new_password
# end

# def verify_password(password)
#   puts '** Login **'
#   print 'Password: '
#   input = gets.chomp

#   if input == password
#     puts 'Welcome to the inside!'
#   else
#     puts 'Authentication failed.'
#   end
# end

# password = set_password
# if !password
#   set_password
# end

# verify_password(password)

# Question 9

# def valid_integer?(string)
#   string.to_i.to_s == string
# end

# def guess_number(max_number, max_attempts)
#   winning_number = (1..max_number).to_a.sample
#   attempts = 0

#   loop do
#     attempts += 1
#     break if attempts > max_attempts

#     input = nil
#     until valid_integer?(input)
#       print 'Make a guess: '
#       input = gets.chomp
#     end

#     guess = input.to_i

#     if guess == winning_number
#       puts 'Yes! You win.'
#       break
#     else
#       puts 'Nope. Too small.' if guess < winning_number
#       puts 'Nope. Too big.'   if guess > winning_number
#     end
#   end
# end

# guess_number(10, 3)
