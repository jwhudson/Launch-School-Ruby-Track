# Video Example

# def string_reverser(string)
#   arr = string.chars
#   reversed_arr = []
#   count = arr.length - 1
#   arr.length.times do
#     reversed_arr << arr[count]
#     count -= 1
#   end
#   reversed_arr.join("")
# end

# p string_reverser("james")

# 3 = fizz
# 5 = buzz
#both = fizzbuzz

# def fizzbuzz(starting_num, ending_num)
#   for num in (starting_num..ending_num) do
#     if num % 3 == 0 && num % 5 == 0
#       puts "Fizzbuzz"
#     elsif num % 3 == 0
#       puts "Fizz"
#     elsif num % 5 == 0
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# fizzbuzz(1,15)

# def interleave(array_1, array_2)
#   output_array = []
#   counter = 0
#   array_1.length.times do
#     output_array << array_1[counter]
#     output_array << array_2[counter]
#     counter += 1
#   end
#   p output_array
# end

# p interleave([1,2,3], ["a","b","c"]) == [1, "a", 2, "b", 3, "c"]

# def substring(string, start_num, end_num=start_num)
#   string[start_num..end_num]
# end

# # p substring("honey", 0, 2)
# # p substring("honey", 1, 2)
# # p substring("honey", 3, 9)
# # p substring("honey", 2)

# # Write a method that finds all substrings in a string

# def substrings(string)
#   characters = string.chars
#   length = string.length
#   output_arr = []
#   characters.each_index do |index|
#     count = index + 1
#     loop do
#       output_arr << string[index..count]
#       count += 1
#       break if count >= length
#     end
#   end
#   output_arr.pop
#   output_arr1
# end

# p substrings("band")
# p substrings("world")
# p substrings("ppop")


# Study Group

# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of only negative numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

# def max_sequence(array)
#   return 0 if array == []
#   starting_index = 0
#   ending_index = 0
#   largest_sum = 0
#   loop do
#   ending_index = starting_index
#     loop do
#       if array[starting_index..ending_index].sum > largest_sum
#         largest_sum = array[starting_index..ending_index].sum
#       end
#     ending_index += 1
#     break if ending_index > array.length
#     end
#     starting_index += 1
#     break if starting_index > array.length
#   end
#   largest_sum
# end

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.


# def common_chars(array)
#   #Iterate over the characters in the first element
#   #Count how many times the character occurs in each word
#   #If the number of occurances is unequal, keep the lower value
#   #Return an array of the letters where the value is at least 1
#   output_arr = []
#   array[0].each_char do |letter|
#     index = 0
#     letter_count = array[index].count(letter)
#     loop do
#       index += 1
#       break if index >= array.length
#       if array[index].count(letter) < letter_count
#         letter_count = array[index].count(letter)
#       end
#     end
#     if letter_count > 0 && !output_arr.include?(letter)
#       letter_count.times do
#         output_arr << letter
#       end
#     end
#   end
#   p output_arr
# end


# common_chars(["bella","label","roller"]) == ["e", "l", "l"]
# common_chars(["cool","lock","cook"]) == ["c", "o"]
# common_chars(["hello","goodbye","booya", "random"]) == ["o"]
# common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []

# def word_cap(string)
#   arr = string.split(" ")
#   arr.each do |word|
#     word[0] = word[0].upcase
#   end
#   puts arr.join(" ")
# end

# word_cap("four score and seven")
# word_cap("this is a 'quoted' word")

# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

# def remove_duplicate(string)
#   #Break the string into characters
#   #Iterate over the characters
#   #For each character, check if the next character is the same
#   # If yes, change the character to nil and check the next character
#   # Repeat until the next character is different to the current one
#   # Skip the cycle if character is nil
#   # Remove all nil values from array
#   #Join the array back toa  string and return

#   letters = string.downcase.chars
#   letters.each_index do |index|
#     sub_loop_index = index
#     loop do
#       sub_loop_index += 1
#       if sub_loop_index >= letters.length
#         break
#       end
#       if letters[index] == letters[sub_loop_index]
#         letters[sub_loop_index] = nil
#       else
#         break
#       end
#     end
#   end
#   letters.delete(nil)
#   p letters.join.capitalize
# end

# # The method takes a string argument
# # The method must return a string
# # All consecutive characters in teh string are to be collapsed into 1

# p remove_duplicate("Hello") == "Helo"
# p remove_duplicate("Necessary") == "Necesary"
# p remove_duplicate("oooooh") == "oh"
# p remove_duplicate("bbbbbb") == "b"
# p remove_duplicate("wwooonnndddeeerrrfuuulll wwwwwooorrrrllllddd") == "wonderful world"
