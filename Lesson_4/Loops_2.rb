# Question 1

count = 1

loop do
  if count.even?
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  count += 1
  break if count > 5
end

# Question 2

loop do
  number  = rand(100)
  puts number
  break if number.between?(0, 10)
end

# Question 3


process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed"
end

# Question 4

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  end
  puts "That's not quite right, try again."
end

# Question 5

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end
p numbers

# Question 6

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.size == 0
end

# Question 7

5.times do |index|
  puts index
  break if index == 2
end

# Question 8

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Question 9

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next if number_a < 5 || number_b < 5
  puts "5 was reached!"
  break
end

# Question 10

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

count = 0

while count < number_of_greetings
  greeting
  count += 1
end