# Practice problems taken from various Launch School problems and also Code wars katas.

# Given an array, find the integer that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# def find_it(seq)
#   arr = seq.select do |number|
#     amount = seq.count(number)
#     amount.odd?
#   end
#   arr[0]
# end

# Define a method that takes an array as an argument
# Iterate through the array
#Count each element
# If odd, select the element
# Output will be an array with one number repeated

# p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])
# p find_it([1,1,2,-2,5,2,4,4,-1,-2,5])
# p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5])
# p find_it([10])
# p find_it([1,1,1,1,1,1,10,1,1,1,1])

#----------------------------------------------------------------------------#

# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

# def unique_in_order(sequence)
#   if sequence.class != Array
#     characters = sequence.split("")
#   else
#     characters = sequence
#   end
#   output_array = []
#   characters.each do |char|
#     next if char == output_array.last
#     output_array << char
#   end
#   output_array
# end

# p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# p unique_in_order([1,2,2,3,3])       == [1,2,3]

# Turn string into an array of characters
# Create an empty output array
# Iterate over the array of characters
# Push the first element into the output array
# Check if the next element in the character array is the same as the last element of the output array
#If yes, skip
# If not then push character element into output array

#---------------------------------------------------------------------------#

# Your task is to construct a building which will be a pile of n cubes. The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.

# You are given the total volume m of the building. Being given m can you find the number n of cubes you will have to build?

# The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m if such a n exists or -1 if there is no such n.
# Examples:

# Define a method that takes an integer argument
# Initliaise a running total and set it to 0
# Initialise a count variable
# Square root the number, this is the target variable
# Loop through integers starting at 1 adding their value to the running total
# Increment the count by one
# Stop once the running total is equal to the target variable or once the running total is greater than the target variable
# If the running total is greater than the target variable, return -1
# Otherwise return the count

# def findNb(number)
#   running_total = 0
#   count = 0
#   target_variable = Math.sqrt(number).to_i
#   loop do
#     count += 1
#     running_total += count
#     break if running_total >= target_variable
#   end
#   if running_total > target_variable
#     -1
#   else
#     count
#   end
# end

# p findNb(100) # -- > 4
# p findNb(1071225)#  --> 45
# p findNb(202509000100)# --> -1


#-------------------------------------------------------------------------#

# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.


# Define a method with one parameter (string)
# Split the string into an array on each word
# Initialise an empty array to keep scores
# Initialise an array to hold the letter scores
# Iterate through the array of words
# For each word split the letters into a sub array of individual characters
# Loop through each letter and look up it's score
# Total the letter scores and push the overall score to the score array

# def alphabet_score(string)
#   words = string.split(" ")
#   scores = []
#   letter_array = ("a".."z").to_a
#   words.each  do |word|
#     word_score = 0
#     characters = word.chars
#     characters.each do |char|
#       word_score += letter_array.index(char) + 1
#     end
#     scores << word_score
#   end
#   highest_index = scores.index(scores.max)
#   words[highest_index]
# end

# p alphabet_score('man i need a taxi up to ubud')# == 'taxi'
# p alphabet_score('what time are we climbing up the volcano')# == 'volcano'
# p alphabet_score('take me to semynak')# == 'semynak'
# p alphabet_score('aa b')# == 'aa'

#-------------------------------------------------------------------------#

# Make a program that filters a list of strings and returns a list with only your friends name in it.

# If a name has exactly 4 letters in it, you can be sure that it has to be a friend of yours! Otherwise, you can be sure he's not...

# Note: keep the original order of the names in the output.

# Define a method that takes a list of strings (array)
# Return an array containing only 4 letter names
# Keep the original order of the list


# Define a method with one paramater
# Iterate over the array argument
# Only select the words with a length of 4
# Return an array containing these words


# def friends(array)
#   array.select { |word| word.length == 4 }
# end

# p friends ["Ryan", "Kieran", "Mark"]

#-------------------------------------------------------------------------#

#Find the missing letter

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.

# Define a method with one argument (array)
# Array will always be valid
# One letter will be missing from an alphabetical sequence
# Return the missing letter with the correct case


# Define the method with one argument
# Take the first element of the argument and the last element of the argument and create a range
# Convert the range to an array
# Iterate over the range array
# Check if the letter appears in the argument array
# If yes, do nothing, if not, return the letter

# def find_missing_letter(arr)
#   letter_range = (arr[0]..arr.last).to_a
#   missing_letter = letter_range.select { |letter| !arr.include?(letter) }
#   missing_letter[0]
# end

# p find_missing_letter(["a","b","c","d","f"]) == "e"
# p find_missing_letter(["O","Q","R","S"]) == "P"

#-------------------------------------------------------------------------#

# Trolls are attacking your comment section!

# A common way to deal with this situation is to remove all of the vowels from the trolls' comments, neutralizing the threat.

# Your task is to write a function that takes a string and return a new string with all vowels removed.

# For example, the string "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".

# Note: for this kata y isn't considered a vowel.


# Define a method with one argument (string)
# Remove all the vowels from the string
# Returns a new string with the vowels removed - both uppercase and lowercase
# Y is not considered a vowel for this exercise

# Define a method that takes a string argument
# Initialise a data structure containing all the vowels.
# Split the string argument into an array of words
# Iterate over the word array
# Split each word into an array of characters
# Iterate over the array of characters
# If the character is not a vowel select it
# Join the characters back into the word
# Join the words back together into a string

# def disemvowel(string)
#   vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
#   words = string.split(" ")
#   filtered_words = words.map do |word|
#     letters = word.chars
#     filtered_letters = letters.select { |letter| !vowels.include?(letter) }
#     filtered_letters.join("")
#   end
#   filtered_words.join(" ")
# end


# p disemvowel("This website is for losers LOL!")  == "Ths wbst s fr lsrs LL!"

#-------------------------------------------------------------------------#


# Capitalize each word in a string

# Define a method with one parameter
# Return a string with each word capitalized

# Define a method with one parameter (string)
# Split the string into an array of words
# Iterate through the word array
# Capitalize each word
# Join the array back into a string
# Return the modified string

# def capitalize(string)
#   word_array = string.split(" ")
#   capitalized_words = word_array.map do |word|
#     word.capitalize
#   end
#   capitalized_words.join(" ")
# end

# p capitalize("How can mirrors be real if our eyes aren't real") ==  "How Can Mirrors Be Real If Our Eyes Aren't Real"

#-------------------------------------------------------------------------#

# Create a function named divisors/Divisors that takes an integer n > 1 and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime'

# Define a method with one parameter(Integer)
# Returns an array of divisors
# Don't include 1 in the array
# Dont include the argument in the array
# If the argument is prime return "(Integer) is prime"

# Define a method with one parameter (Integer)
# Set a range from 2 to Integer - 1
# Convert the range to an array
# Initialize an empty output array
# Iterate through the number array
# Check if the Integer argument is divided equally be the current number array element
# If yes, put that element into the output array
# If not, go to the next element
# Check if the output array is empty or not
# If yes, return "Argument is prime"
# If no, return the output array

# def divisors(num)
#   number_array = (2..(num - 1)).to_a
#   output_array = []
#   number_array.each do |digit|
#     if num % digit == 0
#       output_array << digit
#     end
#   end
#   if output_array.empty?
#     return "#{num} is a prime"
#   else
#     output_array
#   end
# end


# p divisors(12) # should return [2,3,4,6]
# p divisors(25) # should return [5]
# p divisors(13) # should return "13 is prime"

#-------------------------------------------------------------------------#

# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.


# Define a mthod with one parameter (String)
# Each letter to be replaced with the number of it's position in the alphabet
# Ignore anything that is not a letter, do not return these characters
# Return a string

# Define a method with one paramater (String)
# Split the string into an array of individual characters (downcased)
# Use a collection to store the values of the alphabet, array/hash
# Initialize an output_array
# Iterate through the character array
# Compare the character to the alphabet values collection
# If it is a letter, place it's value into the output_array
# Ignore it if it is not a letter, do not store in output array
# Convert the output array to a string
# Return the string

# def alphabet_position(text)
#   characters = text.downcase.chars
#   letter_array = ("a".."z").to_a
#   output_array = []
#   characters.each do |char|
#     if letter_array.include?(char)
#       output_array << (letter_array.index(char) + 1)
#     end
#   end
#   output_array.join(" ")
# end



# p alphabet_position("The sunset sets at twelve o' clock.") # == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

#-------------------------------------------------------------------------#

# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

#-------------------------------------------------------------------------#

# Some numbers have funny properties. For example:

#     89 --> 8¹ + 9² = 89 * 1

#     695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

#     46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

#     we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.

# In other words:

#     Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

# Note: n and p will always be given as strictly positive integers.


# Define a method that has two parameters
# Both positive parameters
# Return k if the sum of each number ^ power is equal to k * sum

# Define a method to take two arguments ( n , p)
# convert n to a string
# split the string into individual characters
# initialise a count/total variable
# iterate over the character array
# first elemet of the character array is to the power p
# perform calculation and store result in the total variable
# repeat for next character
# increment p by 1 for each repitition
# add each sum to the total variable
# check if total % n == 0
# if yes return total / n
# if not return -1

# def dig_pow(num, power)
#   str = num.to_s
#   char_array = str.chars
#   count = 0
#   power_increment = 0
#   char_array.each do |char|
#     number = char.to_i
#     count += number**(power + power_increment)
#     power_increment += 1
#   end
#   if count % num == 0
#     count / num
#   else
#     -1
#   end
# end


# dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
# dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
# dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
# p dig_pow(46288, 3) # should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

#-------------------------------------------------------------------------#

# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters.

# Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# Input
# 2 arguments
# String
# Array

# Output
#Array of anagrams
# Empty array if there are no anagrams

# Define a method that takes two arguments, a string and an array
# initialize an empty output array
# split the string argument into an array of characters and assign to a variable
# iterate through the  array argument
# for current array element, iterate through character array
# If character occurs in array element, count how many times it occurs
# If the character occurs equally in both the string argument and current array argument, move onto next character
# Otherwise move onto next array element
# If all characters occur and the counts are the same, include array element in output array
# return output array



# def anagrams(string, array)
#   output_array = []
#   characters = string.chars
#   array.each do |word|
#     to_be_output = true
#     characters.each do |letter|
#       if word.include?(letter)
#         if word.count(letter) == characters.count(letter)
#           next
#         else
#           to_be_output = false
#         end
#       else
#         to_be_output = false
#       end
#     end
#     if to_be_output && (characters.size == word.size)
#       output_array << word
#     end
#   end
#   output_array
# end

# p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) # => ['aabb', 'bbaa']
# anagrams("abba", ["dada"])
# p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) # => ['carer', 'racer']

# p anagrams('laser', ['lazing', 'lazy',  'lacer'])#=> []

#-------------------------------------------------------------------------#

# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

# For example:

# Let's say you are given the array [1,2,3,4,3,2,1]:
# Your method will return the index 3, because at the 3rd position of the array, the sum of left side of the index [1,2,3] and the sum of the right side of the index [3,2,1] both equal 6.

# Another one:
# You are given the array [20,10,-80,10,10,15,35]
# At index 0 the left side is []
# The right side is [10,-80,10,10,15,35]
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.

# Input
# Array argument
# Output
# Index where the LHS is equal to the RHS
# If no such index exists, return -1

# Define a method that takes an array
# Initialise an empty Left hand side array
# Initialise a right hand side array which is equal to the array parameter
# Begin a loop
# Bring out the first index of the RHS loop
# Check the total of LHS and RHS array
# if the array is empty, total = 0
# If the array's do not match, move the first indexed element from RHs to LHS
# break the loop if the totals are equal
# break the loop if the RHS array is empty
# return the value of the index where LHS == RHS



# def find_even_index(array)
#   left_hand_array = []
#   right_hand_array = array

#   loop do
#     current_element = right_hand_array.shift
#     right_hand_total = right_hand_array.sum
#     if left_hand_array.size == 0
#       left_hand_total = 0
#     else
#       left_hand_total = left_hand_array.sum
#     end

#     if right_hand_total == left_hand_total
#       return left_hand_array.size
#     end
#     if right_hand_array.size == 0
#       return -1
#     end
#     left_hand_array << current_element
#   end
# end


# find_even_index([1,1,1])
# p find_even_index([1,2,3,4,3,2,1]) == 3
# p find_even_index([1,100,50,-51,1,1]) == 1
# p find_even_index([1,2,3,4,5,6]) == -1
# p find_even_index([20,10,30,10,10,15,35]) == 3
# p find_even_index([20,10,-80,10,10,15,35]) == 0
# p find_even_index([10,-80,10,10,15,35,20]) == 6
# p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

#-------------------------------------------------------------------------#

# input: # Given 2 strings, your job is to find out if there is a substring
# # that appears in both strings. You will return true if you find a
# # substring that appears in both strings, or false if you do not.
# # We only care about substrings that are longer than one letter long.

# INPUT
# 2 string arguments


# OUTPUT
# Substrings that appear in both strings
# Substrings > 1 letter long
# False otherwise

# Define a method with 2 parameters
# Initialize two empty substrings arrays
# Split the first string into an array of characters
# Iterate through the characters
# Begin a loop
# initialise a count variable, set the initial value equal to index
# For each iteration, add a substring to the corresponding substrings array starting with current index element + 1
# Increase the length of the substring by one for each iteration
# Break when the length of the substring reaches the end of the character array
# This will repeat for each element in characters
#Repeat the process for the second string argument, this time adding the substrings to the other substring array
# Compare the two substring arrays
# Do this by iterating over the first substring array
# If the second substring array contains the current element, return true
# If none of the elements are contained in the second substring array, return false

# def substring_test(string_1, string_2)
#   substrings_one = []
#   substrings_two = []
#   first_string_characters = string_1.downcase.chars
#   second_string_characters = string_2.downcase.chars
#   first_string_characters.each_with_index do |letter, index|
#     count = 1
#     loop do
#       break if count > string_1[index..-1].size
#       substrings_one << string_1[index, count].downcase
#       count += 1
#     end
#   end
#     second_string_characters.each_with_index do |letter, index|
#     count = 1
#     loop do
#       break if count > string_2[index..-1].size
#       substrings_two << string_2[index, count].downcase
#       count += 1
#     end
#   end
#   substrings_one.each do |substring|
#     if substring.size > 1
#       return true if substrings_two.include?(substring)
#     end
#   end
#   false
# end


# p substring_test('Something', 'Fun') ==  false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

#-------------------------------------------------------------------------#

# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

# #Example 1: a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# #Example 2: a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []
# Notes:

#     Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

#     In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

#     Beware: r must be without duplicates.
#     Don't mutate the inputs.


# Input
# The method takes two array arguments

# Output
# An array of strings that appear as substrings in a2
# An empty array if no substrings appear

# Define a method with two parameters (Both arrays)
# Initialize an empty output array
# Iterate over the first array
# For each element loop over the second array
# Check if the arr1 element is a substring in any arr2 element
# If yes push this element to the output array


# def in_array(array1, array2)
#   output_array = []
#   array1.each do |substring|
#     array2.each do |word|
#       if word.include?(substring)
#         output_array << substring
#         break
#       end
#     end
#   end
#   output_array
# end

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# p in_array(a1, a2) == ["arp", "live", "strong"]

#-------------------------------------------------------------------------#

# You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.
# Examples

# [2, 4, 0, 100, 4, 11, 2602, 36]
# Should return: 11 (the only odd number)

# [160, 3, 1719, 19, 11, 13, -21]
# Should return: 160 (the only even number)

# Input
# Array of numbers

# Output
# An integer

# Define a method with one parameter (array)
# initialize an evens variable
# initialise an odds variable
# iterate through the array paramater, choosing all even values
# assign this to the evens variable
# iterate through the array parameter, choosing all odd values
# assign this to the odds variable
# check the size of odds and evens
# return the first element where the array size is equal to 1

# def find_outlier(integers)
#   evens = integers.select { |number| number.even? }
#   odds = integers.select { |number| number.odd? }
#   if evens.size == 1
#     evens[0]
#   else
#     odds[0]
#   end
# end

# p find_outlier([2,6,8,10,3]) == 3

#-------------------------------------------------------------------------#

# INPUT
# Method with two integer parameters, length and width
# These will be different values

# OUTPUT
# If length == width return Nil
# If length != width return an array of numbers
# These numbers represent the area of perfect squares whose sum is that of the area of the rectangle

# define a method that takes two parameters (integers)
# initialise an array variable and set it equal to length * width
# Area of the largets perfect square is dictated by the smallest value out of length and width
# Square the smallest value (length or width)
# Subtract the value of the area of the perfect square from the total area
# Subtract the smaller value (length or width) from the larger value
# These give the dimensions of the remaining area
# Repeat the process until the area is 0
# The minimum value for length and width must be 1


# Define a method that takes two parameters (integers)
# If height == width return nil
# Initialise a total area variable equal to length * width
# Initialise a current width variable and set it equal to width
# Initialise an current height variable and set it equal to height
# Initialise an empty output array
# Begin a loop
# Square the smaller value out of current height and current loop
# Place the squared number into an output array
# Subtract this squared value from total area
# The new area will be the result of this subtraction
# Subtract the smaller of current height/ current width from the larger one
# Break the loop if the current area = 0
# The current height and current width cannot fall below 0
# Return the output array

# require "pry"

# def sqInRect(lng, wdth)
#   return nil if lng == wdth
#   total_area = lng * wdth
#   current_width = wdth
#   current_height = lng
#   output_array = []
#   loop do
#     if current_height > current_width
#       sqr_num = current_width
#       sqr_area = current_width * current_width
#       current_height -= current_width
#     else
#       sqr_num = current_height
#       sqr_area = current_height * current_height
#       current_width -= current_height
#     end
#       output_array << sqr_num
#       total_area -= sqr_area
#     break if total_area <= 0
#   end
#   output_array
# end

# p sqInRect(8, 3)
# p sqInRect(3, 5)
# p sqInRect(3, 2)

#-------------------------------------------------------------------------#

# The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position.

# The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)

# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

# 1.  The input string will always be lower case but maybe empty.
# 2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

# INPUT
# Method definition with one paramater (string)
# Always lowercase
# May be empty

# OUTPUT
# Array of strings
# An empty array if the input is empty
# Ignore whitespace

# Initialise a method that takes one parameter (string)
# Split the string into an array of characters
# Assign this array to a variable
# Initialise an empty output array
# Iterate over the array
# Skip to the next iteration if the current element is whitespace
# For each iteration capitalise the current array element in the string argument
# Use the current element index to do this
# Add the string with the capitalised letter to the output array
# Return the output array

# def wave(string)
#   characters = string.chars
#   output_array = []
#   characters.each_with_index do |letter, index|
#     next if letter == " "
#     string = string.downcase
#     string[index] = letter.upcase
#     output_array << string
#   end
#   p output_array
# end


# wave("hello") # => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

#-------------------------------------------------------------------------#


# Write a program that will calculate the number of trailing zeros in a factorial of a given number.

# N! = 1 * 2 * 3 * ... * N

# Be careful 1000! has 2568 digits...

# INPUT
# An integer
# OUTPUT
# The integer number of trailing 0's in the factorial of the integer input

# Define a method that has one parameter
# Calculate the factorial of the integer argument
# Convert this factorial to a string
# split the string into an array of characters
# Initialise a count variable
# Iterate over the array
# If the current character element is 0 increment the count by one
# If not, set the count equal to 0
# Return the count

# def zeros(number)
#   factorial = fact(number)
#   factorial_string = factorial.to_s
#   factorial_chars = factorial_string.chars
#   count = 0
#   factorial_chars.each do |char|
#     if char == "0"
#       count += 1
#     else
#       count = 0
#     end
#   end
#   count
# end

#-------------------------------------------------------------------------#

# Complete the solution so that the function will break up camel casing, using a space between words.
# Example

# Input
# A string wirten in camel case

# Output
# A string that is split into words

# Initialise a method with one paramater (string)
# Split the string into an array of characters
# Initialise an empty output array
# Iterate through the array of characters
# Push each character to the output array
# If the next letter is a capital also push a space to the output array
# Join the output array
# Return the resulting string

# def solution(string)
#   characters = string.chars
#   output_array = []
#   characters.each_with_index do |char, index|
#     output_array << char
#     if ("A".."Z").include?(characters[index + 1])
#       output_array << " "
#     end
#   end
#   output_array.join("")
# end

# solution("camelCasing")  ==  "camel Casing"

#-------------------------------------------------------------------------#

# Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. The sum of the squared divisors is 2500 which is 50 * 50, a square!

# Given two integers m, n (1 <= m <= n) we want to find all integers between m and n whose sum of squared divisors is itself a square. 42 is such a number.

# The result will be an array of arrays or of tuples (in C an array of Pair) or a string, each subarray having two elements, first the number whose squared divisors is a square and then the sum of the squared divisors.

# INPUT
# Given two integers
# First integer will be greater than or equal to 1
# Second number will be greater than or equal to first number

# OUTPUT
# An array of arrays
# Sub arrays contain two integers
# First integer is a number whose squared divisors is a square number
# Second integer The sum of the squared divisors

# Initialise a method with two parameters (number1, number2)
# Range of numbers between number1 and number2
# Make this range an array
# Initialise an output array
# Iterate over the array of numbers
# Initialise an empty array
# Loop from 1 to the current element
# Push each number in the loop into the empty array that is a divisor of the current element
# Iterate over the array of divisors
# Initialise a square_num vairable and set it equal to 0
# Square each element and add it to the square_num variable
# If the Square root of the square_num variable is a whole number push the current element of the outer loop and the square_num variable total to the output array as an array
# Return the output array

# def list_squared(number_1, number_2)
#   number_range = (number_1..number_2).to_a
#   output_array = []
#   number_range.each do |integer|
#     divisors_array = []
#     for n in (1..integer) do
#       if integer % n == 0
#         divisors_array << n
#       end
#     end
#     square_num = 0
#     divisors_array.each do |num|
#       square_num += num * num
#     end
#     if Math.sqrt(square_num) % 1 == 0
#       output_array << [integer, square_num]
#     end
#   end
#   p output_array
# end

# p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
# p list_squared(42, 250) == [[42, 2500], [246, 84100]]

#-------------------------------------------------------------------------#

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# INPUT
# Array

# OUTPUT
# A new array, same as the input array but with the first element moved to the end of the returned array.

# Define a method that takes one paramater (array)
# initialise a variable equal to the first element of the array
# Initialise an empty output array
# Iterate over the input array
# push each value to the output array
# Remove the first element of the output array
# Push the first element variable to the output array
# Return the output array

# def rotate_array(array)
#   first_element = array[0]
#   output_array = []
#   array.each do |element|
#     output_array << element
#   end
#   output_array.shift
#   output_array << first_element
#   output_array
# end


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

#-------------------------------------------------------------------------#

# Write a method that can rotate the last n digits of a number. For example:

# INPUT
# 2 inputs
# Both integers
# First input is a number
# Second input is the amount of digits to be rotated


# OUTPUT
# Integer with its digit is rotated

# Initialise a method with 2 parameters
# First argument is the number to be rotated
# Second argument is the index where the rotation begins
# Set the first argument equal to a variable
# Convert the variable to a string and split it into an array of characters
# Initialise a variable called rotated arr
# Set the variable to the result of splitting the array from the second parameter to the end of the array, this needs to mutate the array of characters
# Pass the second variable into the rotate_array method
# Push the rotated array into the array of characters
# Flatten the array
# Join the array and change it to an integer
# Return the integer

# def rotate_rightmost_digits(number, rotated_digits)
#   num = number.to_s
#   num_array = num.chars
#   rotated_arr = num_array.slice!(- rotated_digits..-1)
#   num_array << rotate_array(rotated_arr)
#   num_array.flatten.join("").to_i
# end



# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

#-------------------------------------------------------------------------#

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# INPUT
# Integer

# OUTPUT
# Integer having undergone rotation

# Initialise a method with one parameter
# Initialise a variable and set it equal to the argument
# Initialise a count variable set it equal to 1
# Begin a loop
# Reinitialise the variable to the rotate_rightmost_digits method
# Use the variable as the first argument and the negative of the count for the second
# Break the loop when the count is the same as the argument.to_s length
# Return the variable

# def max_rotation(number)
#   output_number = number
#   count = number.to_s.length
#   loop do
#     output_number = rotate_rightmost_digits(output_number, count)
#     count -= 1
#     break if count == 0
#   end
#   output_number
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

#-------------------------------------------------------------------------#

# Have the method letter_changes(str) take the str parameter being passed and
# modify it using the following algorithm. Replace every letter in the string
# with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.

# INPUT
# String of any characters


# OUTPUT
# String where only the letters have been changed "left" by three alphabetically
# Ignore any non aplhabetic characters
# xyz wraps around to abc
# Case sensitive

# Initialise a method with one paramater (string)
# Initialise an empty output array
# Initialise an array of all lower case letters
# Initialise an array of all uppercase letters
# Split the string parameter into an array of characters
# Iterate over the array of characters
# Check if the uppercase array contains the current element
# If yes, find the position of the element within the array
# Initialise a position variable and store this value in there
# Add 3 to the position variable
# If the variable is above 25, subtract 25
# Find the element in the uppercase array that occurs at the position variable
# Push this element to the output array
# Check if the lowercase element contains the current character element
# If yes, repeat above steps but for lower case array
# If the current character element is not a letter, push it to the output array
# Return the joined output array

# def letter_changes(string)
#   output_array = []
#   lowercase_array = ("a".."z").to_a
#   uppercase_array = ("A".."Z").to_a
#   characters = string.chars
#   characters.each do |char|
#     if lowercase_array.include?(char)
#       index_position = lowercase_array.index(char)
#       index_position += 3
#       if index_position > 25
#         index_position -= 26
#       end
#       output_array << lowercase_array[index_position]
#     elsif uppercase_array.include?(char)
#       index_position = uppercase_array.index(char)
#       index_position += 3
#       if index_position > 25
#         index_position -= 26
#       end
#       output_array << uppercase_array[index_position]
#     else
#       output_array << char
#     end
#   end
#   output_array.join("")
# end

# p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
# p letter_changes("Road trip9") == "Urdg wuls9"
# p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
# p letter_changes('xyz') == ('abc')

#-------------------------------------------------------------------------#

# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# INPUT
# One argument that's the total number of switches


# OUTPUT
# Array of numbers
# Identifying which lights are on after all the switches have been pressed n times

# Number of switches
# Output array
# Have an array of n zeros, where n is the argument
# Press the swtiches N times
# Only pressing the switch where the position is divisible by the number of passes that have been done
# When it's the second pass and we have 10 switches , press all the even switches
# When a switch is pressed toggle between 0 and 1
# After n passes return an array of the lights that are on

# Initialise a method with one parameter (number)
# Initialise an empty output array
# Begin a loop
# Loop *number* times
# Each loop push 0 to the output array
# End of loop
# Initialise a count variable equal to 1
# Begin a loop
# Loop *number* of times
# Iterate over the output array
# If the index of the switch & count equals 0
# Toggle the switch from 0 to 1
# If the swtich is already 1 then we toggle from 1 to 0
# Increment the count
# Break when the count is equal to *number*
# Initialise a light_on array
# Iterate over the output array
# If the current element is 1
# Push the index to the light on array (+1)
# Reutrn the light on array

# def lights(number)
#   output_array = []
#   number.times do
#     output_array << 0
#   end
#   count = 1
#   number.times do
#     output_array.each_with_index do |light, index|
#       if (index + 1) % count == 0
#         if output_array[index] == 0
#           output_array[index] = 1
#         else
#           output_array[index] = 0
#         end
#       end
#     end
#     count += 1
#   end
#   light_on = []
#   output_array.each_with_index do |light, index|
#     if light == 1
#       light_on << index + 1
#     end
#   end
#   light_on
# end



# p lights(5) #== [1, 4]
# p lights(10) #== [1, 4, 9]

#-------------------------------------------------------------------------#