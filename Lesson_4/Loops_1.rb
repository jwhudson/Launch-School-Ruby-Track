#Loops 1

# Question 1

loop do
  puts "Just keep printing..."
  break
end

# Question 2

loop do
  puts "This is the outer loop."

  loop do
    puts "This is the inner loop."
    break
  end
  break
end

puts "This is outside all loops."

# Question 3

iterations = 1

loop do
  puts "Numnber of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# Question 4

loop do
  puts "Should I stop looping?"
  answer = gets.chomp
  break if answer == "yes"
  puts "If you wish to stop the loop, enter 'yes'"
end

# Question 5

say_hello = true
times = 0

while say_hello
  puts "Hello!"
  times += 1
  say_hello = false if times == 5
end

# Question 6

numbers = []


while numbers.size < 5
  numbers.push(rand(100))
end

p numbers

# Question 7

count = 1

until count == 11
  puts count
  count += 1
end

# Question 8

numbers = [7, 9, 13, 25, 18]

until numbers.size == 0
  puts numbers.shift
end

# Question 8

for i in 1..100
  puts i if i.odd?
end

# Question 9

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello #{friend}!"
end