# Question 1

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

def sum_of_sums(array)
  total = 0
  count = 0
  sub_count = 0
  entries = array.size

  loop do
  loop do
    total += array[sub_count]
    break if sub_count == count
    sub_count += 1
  end
  count += 1
  break if count == entries
  sub_count = 0
  end
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Question 2

# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

def madlibs
  puts "Enter a noun:"
  noun = gets.chomp
  puts "Enter a verb:"
  verb = gets.chomp
  puts "Enter an adjective:"
  adjective = gets.chomp
  puts "Enter an adverb:"
  adverb = gets.chomp
  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious"
end

madlibs

# Question 3

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

def substrings_at_start(string)
  characters = string.chars
  output_arr = []
  accumulator = []
  characters.each do |char|
    accumulator << char
    output_arr << accumulator.join("")
  end
  p output_arr.flatten
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Question 4

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

def substrings(string)
  characters = string.chars
  output_arr = []
  accumulator = []
  string.length.times do
    characters.each do |char|
      accumulator << char
      output_arr << accumulator.join("")
    end
  characters.shift
  accumulator = []
  end
  output_arr.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Question 5

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def palindromes(string)
  output_arr = substrings(string)
  p output_arr.select { |word| word == word.reverse && word.length > 1 }
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Question 6

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  arr = (start_num..end_num).to_a
  arr.map do |num|
    if num % 5 == 0 && num % 3 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Question 7

# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  characters = string.chars
  output_arr = []
  characters.each do |char|
    output_arr << char * 2
  end
  output_arr.join("")
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Question 8

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(string)
  output_string = ""
  string.each_char do |char|
    if char =~ /[a-zA-Z]/
      if char =~ /[^aeiou]/
        output_string << char << char
        next
      end
    end
    output_string << char
  end
  p output_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Question 9

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(num)
  p num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Question 10

# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

def center_of(string)
  middle = string.length / 2
  characters = string.chars
  if string.length.odd?
    characters[middle]
  else
    "#{characters[middle-1]}#{characters[middle]}"
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'