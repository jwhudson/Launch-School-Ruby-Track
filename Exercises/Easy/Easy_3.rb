# Question 1

def prompt(string)
  puts "=> #{string}"
end

arr = []

def correct_suffix(num)
  case num
  when 1
    "1st"
  when 2
    "2nd"
  when 3
    "3rd"
  when 4
    "4th"
  when 5
    "5th"
  when 6
    "last"
  end
end

6.times do |num|
  prompt("Enter the #{correct_suffix(num + 1)} number")
  loop do
    arr << gets.chomp.to_i
    break if arr[num].integer?
    puts "Please enter an integer."
  end
end

last_num = arr.pop

if arr.include?(last_num)
  prompt("The number #{last_num} appears in #{arr}.")
else
  prompt("The number #{last_num} does not appear in #{arr}.")
end

# Question 2

puts "Enter the first number:"

number_1 = gets.chomp.to_i

puts "Enter the second number:"

number_2 = gets.chomp.to_i

p "#{number_1} + #{number_2} = #{number_1 + number_2}"
p "#{number_1} - #{number_2} = #{number_1 - number_2}"
p "#{number_1} * #{number_2} = #{number_1 * number_2}"
p "#{number_1} / #{number_2} = #{number_1 / number_2}"
p "#{number_1} ** #{number_2} = #{number_1 ** number_2}"

# Question 3


puts "Please enter a word or multiple words:"
words = gets.chomp

def character_count(words)
  arr = words.split("").select { |char| ("a".."z").include?(char) }
  puts "There are #{arr.length} characters in #{words}"
end

character_count(words)

# Question 4

def multiply(a, b)
  a * b
end


# Question 5

def square(num)
  multiply(num, num)
end


# Question 6

def xor(arg1, arg2)
  arg1 != arg2
end

puts xor(3.even?, 4.even?)

# Question 7

def oddities(arr)
  odd_arr = []
  arr.length.times do |num|
    if (num + 1).odd?
      odd_arr << arr[num]
    end
  end
  odd_arr
end

# Question 8

def palindrome?(string)
  string.split("").reverse.join == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Question 9

def palindrome?(string)
  formatted_string = string.downcase.split("").select { |char| ("a".."z").include?(char) || (0..9).include?(char) }
  formatted_string == formatted_string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == true           # (case does not matter)
p palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p palindrome?('356653') == true
p palindrome?('356a653') == true
p palindrome?('123ab321') == false

# Question 10

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true