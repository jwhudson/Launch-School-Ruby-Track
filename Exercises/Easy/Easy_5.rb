# Question 1

def ascii_value(string)
  arr = string.split("").map { |char| char.ord }
  arr.reduce(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Question 2

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINS_PER_HOUR * HOURS_PER_DAY

def time_of_day(number)
  hour, minute = (MINUTES_PER_DAY + number).divmod(MINUTES_PER_HOUR)
  hour = hour % 24
  format('%02d:%02d',hour, minute)
end

p time_of_day(0)  == "00:00"
p time_of_day(-3)  == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437)  == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Question 2 - Further Exploration

SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
SECONDS_PER_DAY= 60 * MINUTES_PER_DAY

def time_of_day(number)
  zero_hour = Time.new(2020, 02, 16, 00, 00)
  seconds = number * SECONDS_PER_MINUTE
  time = zero_hour + seconds
  time.asctime
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

# Question 3

def after_midnight(string)
  arr = string.split(":")
  hour = arr[0].to_i
  minute = arr[1].to_i
  ((hour * 60) + minute) % 1440
end

def before_midnight(string)
  arr = string.split(":")
  hour = arr[0].to_i
  minute = arr[1].to_i
  minutes = ((hour * 60) + minute) % 1440
  (MINUTES_PER_DAY - minutes) % 1440
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# Question 4

# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def swap(string)
  arr = string.split(" ")
  processed_arr = arr.map { |chars| process_word(chars) }
  processed_arr.join(" ")
end

def process_word(word)
  word = word.chars
  word[0], word[-1] = word[-1], word[0]
  word.join("")
end


p swap("This is a string")
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'


# Question 5

# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

def cleanup(string)
  arr = string.split("")
  cleaned_arr = []
  arr.each do |char|
    if ("a".."z").include?(char)
      cleaned_arr << char
    elsif cleaned_arr[-1] == " "
      next
    else
      cleaned_arr << " "
    end
  end
  p cleaned_arr.join("")
end

p cleanup("---what's my +*& line?") == ' what s my line '

# Question 6

# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(string)
  hash = {}
  arr = string.split(" ")
  arr.each do |word|
    if hash.key?(word.length)
      hash[word.length] += 1
    else
      hash[word.length] = 1
    end
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Question 7

def word_sizes(string)
  hash = Hash.new(0)
  cleaned_arr = cleaning(string)
  cleaned_arr.each do |word|
    hash[word.length] += 1
  end
  hash
end

def cleaning(string)
  string.chars.select { |char| ("a".."z").include?(char.downcase) || char == " " }.join("").split(" ")
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Question 8

# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

def alphabetic_number_sort(array)
  word_arr = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  sorted_arr = array.sort_by do |num|
    word_arr[num]
  end
  sorted_arr
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Question 9

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(string)
  input_arr = string.split(" ")
  output_arr = []
  output_arr = input_arr.map do |str|
    squash(str)
  end
  output_arr.join(" ")
end

def squash(word)
  squashed_arr = []
  split_arr = word.split("")
  split_arr.each do |char|
    squashed_arr << char unless squashed_arr[-1] == char
  end
  squashed_arr.join("")
end



p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Question 10

# Write a method that will take a short line of text, and print it within a box.

def print_in_box(message)
  puts "+#{"-"*(message.length + 2)}+"
  puts "|#{" "*(message.length + 2)}|"
  puts "| #{message} |"
  puts "|#{" "*(message.length + 2)}|"
  puts "+#{"-"*(message.length + 2)}+"
end

print_in_box("To boldly go where no one has gone before.")

Question 11

# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"