# Question 1

puts "Teddy is #{rand(20..200)} years old!"

# Question 2

def floor_space
  p "Enter the width of the room:"
  width = gets.chomp.to_f
  p "Enter the length of the room:"
  length = gets.chomp.to_f
  area = (width * length).round(2)
  area_in_foot = (area * 10.7639).round(2)
  puts "The area of the room is #{area} square meters. (#{area_in_foot}) square foot."
end

floor_space

# Question 3

def tip_value(bill)
  puts "What is the tip percentage?"
  tip_percent = gets.chomp.to_f
  tip = bill * (tip_percent/100)
  puts "The tip is £#{tip}."
  puts "The bill is £#{bill}."
end

tip_value(300)

# Question 4

t = Time.now

def retirement(year)
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "What age would you like to retire?"
  retire = gets.chomp.to_i

  puts "It's #{year}. You will retire in #{year + (retire - age)}."
  puts "You only have #{retire - age} years of work to go!"
end

retirement(t.year)

# Question 5

def name
  puts "Hello, what is your name?"
  user_name = gets.chomp
  if user_name[-1] == "!"
    user_name = user_name.chop
    puts "HELLO #{user_name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{user_name}."
  end
end

name

# Question 6

def print_odd_num_range(range)
  range.to_a.each do |num|
    if num % 2 == 1
      p num
    end
  end
end

print_odd_num_range(1..99)

# Question 7

def print_even_num_range(range)
  range.to_a.each do |num|
    if num.even?
      p num
    end
  end
end

print_even_num_range(1..99)

# Question 8
num = 0
decision = ""


loop do
  puts "Please enter a positive integer:"
  num = gets.chomp.to_i
  break if num >= 1
  puts "Sorry, the number must be positive."
end

puts "You may compute the sum of all numbers between 1 and #{num} or the product of all numbers between 1 and #{num}."

loop do
  puts "Enter 's' to compute the sum or 'p' to compute the product."
  decision = gets.chomp
  break if decision == "s" || decision == "p"
  puts "That's not a valid choice."
end

if decision == "s"
  result = 0
  (1..num).each { |num| result += num }
else
  result = 1
  (1..num).each { |num| result *= num }
end
puts result
