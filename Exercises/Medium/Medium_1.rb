# # Question 1

# # Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# # Do not use the method Array#rotate or Array#rotate! for your implementation.

# def rotate_array(array)
#   output_arr = array.map {|num| num }
#   output_arr << output_arr.shift
#   output_arr
# end


# # # p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# # # p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# # # p rotate_array(['a']) == ['a']

# # # p x = [1, 2, 3, 4]
# # # p rotate_array(x) == [2, 3, 4, 1]   # => true
# # # p x == [1, 2, 3, 4]                 # => true

# # # Question 2

# # # Write a method that can rotate the last n digits of a number. For example:

# def rotate_rightmost_digits(number, digit)
#   output = number.to_s.chars
#   output[-digit..-1] = rotate_array(output[-digit..-1])
#   output.join("").to_i
# end

# # p rotate_rightmost_digits(735291, 1) == 735291
# # p rotate_rightmost_digits(735291, 2) == 735219
# # p rotate_rightmost_digits(735291, 3) == 735912
# # p rotate_rightmost_digits(735291, 4) == 732915
# # p rotate_rightmost_digits(735291, 5) == 752913
# # p rotate_rightmost_digits(735291, 6) == 352917

# # Question 3

# # If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# def max_rotation(number)
#   size = number.to_s.length
#   size.downto(2) do |n|
#   number = rotate_rightmost_digits(number, n)
#   end
#   p number
# end

# p max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845


# Question 4



# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# def switches(n)
#   hash = initialize_hash(n)
#   arr = []
#   n.times do |num|
#     hash.each do |key, value|
#       if key % (num + 1) == 0
#         hash[key] = !value
#       end
#     end
#   end

#   hash.each do |key, value|
#     arr << key if hash[key] == true
#   end
#   p arr
# end

# def initialize_hash(n)
#   hash = {}
#   n.times do |num|
#     hash[num + 1] = false
#   end
#   hash
# end


# switches(1000)
# Example with n = 5 lights:

#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


# # Question 5

# # Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# def diamond(n)
#   stars = 1
#   top_half = []
#   completed_star = []
#   loop do
#     total_space = n - stars
#     top_half << "#{" " * ((total_space) / 2)}#{"*" * stars}#{" " * ((total_space) / 2)}"
#     break if stars >= n
#     stars += 2
#   end
#   bottom_half = top_half.reverse
#   bottom_half.shift
#   completed_star = top_half << bottom_half
#   completed_star.each { |line| puts line }
# end

# diamond(7)

# # Question 6

# def minilang(command_string)
#   stack = []
#   register = 0
#   commands = command_string.split(" ")
#   commands.each do |command|
#     case command
#     when "PUSH"
#       stack.push(register)
#     when "ADD"
#       register += stack.pop
#     when "SUB"
#       register -= stack.pop
#     when "MULT"
#       register *= stack.pop
#     when "DIV"
#       register /= stack.pop
#     when "MOD"
#       register %= stack.pop
#     when "POP"
#       register = stack.pop
#     when "PRINT"
#       puts register
#     else
#       register = command.to_i
#     end
#   end
# end

# minilang('5 PUSH 3 MULT PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('6 PUSH')
# minilang("3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT")

# # Question 7

# # Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# NUMBER_WORDS = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}

# def word_to_digit(string)
#   words = string.scan(/[\w-]+|[[:punct:]]+/)
#   words = words.map do |word|
#     if NUMBER_WORDS.has_key?(word)
#       NUMBER_WORDS[word]
#     else
#       word
#     end
#   end
#     p words.join(" ")
# end

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# # Question 7 - Further Exploration

# DIGIT_HASH = {
#   'Zero' => '0', 'One' => '1', 'Two' => '2', 'Three' => '3', 'Four' => '4',
#   'Five' => '5', 'Six' => '6', 'Seven' => '7', 'Eight' => '8', 'Nine' => '9'
# }.freeze

# def word_to_digit(words)
#   DIGIT_HASH.keys.each do |word|
#     words.gsub!(/\b#{word.downcase}\b/, DIGIT_HASH[word])
#     words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
#     words.gsub!(/\b#{word.upcase}\b/, DIGIT_HASH[word])
#   end
#   p words[/(\d\s)+\S/] = words[/(\d\s)+\d/].split(" ").join("")
#   p words
# end

# word_to_digit('Please call me at FIVE five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# # Question 8


# def fibonacci(num)
#   return 0  if num == 0
#   return 1 if num < 0
#   fibonacci(num - 1) + fibonacci(num - 2)
# end

# p fibonacci(20)


# # fibonacci(1) == 1
# # fibonacci(2) == 1
# # fibonacci(3) == 2
# # fibonacci(4) == 3
# # fibonacci(5) == 5
# # fibonacci(12) == 144
# # fibonacci(20) == 6765

# # Question 9

# def fibonacci(num)
#   current = 1
#   previous = 0
#   next_value = 0
#   num.times do
#     next_value = previous + current
#     previous = current
#     current = next_value
#   end
#   p previous
# end

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last
# end


# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# Question 10

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  p last.to_s.split("").last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4