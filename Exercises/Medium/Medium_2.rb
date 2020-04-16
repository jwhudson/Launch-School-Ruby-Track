# # Question 1

# text = "Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth."

# def longest_sentence(string)
#   arr = string.split(/[.?!]/)
#   arr.each do |sentence|
#     puts sentence.split(" ").length
#   end
# end

# longest_sentence(text)

# # Question 2

# # A collection of spelling blocks has two letters per block, as shown in this list:

# # B:O   X:K   D:Q   C:P   N:A
# # G:T   R:E   F:S   J:W   H:U
# # V:I   L:Y   Z:M

# # This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# # Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.



# def block_word?(string)
#   count = 0
#   arr = [["B", "O"], ["X", "K"],["D","Q"],["C","P"],["N","A"],["G","T"],["R","E"],["F","S"],["J","W"],["H","U"],["V","I"],["L","Y"],["Z","M"]]
#   characters = string.chars
#   formatted_chars = characters.map { |char| char.upcase }
#   arr.each do |sub_arr|
#     formatted_chars.each do |char|
#       if sub_arr.include?(char)
#         count += 1
#       sub_arr[0] = false
#       sub_arr[1] = false
#       end
#     end
#   end
#   string.length == count
# end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# # Question 3

# # In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# # Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# # You may assume that the string will always contain at least one character.

# def letter_percentages(string)
#   hash = {lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
#   arr = string.chars
#   arr.each do |char|
#     if char[/[A-Z]/] == char
#       hash[:uppercase] += 1
#     elsif char[/[a-z]/] == char
#       hash[:lowercase] += 1
#     else
#       hash[:neither] += 1
#     end
#   end
#   hash = hash_conversion(hash, arr.size)
# end

# def hash_conversion(hash, total)
#   hash.each do |key, value|
#     hash[key] = ((hash[key]/total) * 100).round(2)
#   end
# end

# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# # Question 4

# # Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# def balanced?(string)
#   count = 0
#   string.each_char do |bracket|
#     if bracket == "("
#       count += 1
#     end
#     if bracket == ")"
#       count -= 1
#     end
#     break if count < 0
#   end
#   count.zero?
# end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false


# # Question 5

# # A triangle is classified as follows:

# # equilateral All 3 sides are of equal length
# # isosceles 2 sides are of equal length, while the 3rd is different
# # scalene All 3 sides are of different length
# # To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# # Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# def triangle(side_1, side_2, side_3)
#   array = [side_1, side_2, side_3].sort
#   if array[0] + array[1] > array[2]
#     if array[0] == array[1] && array[1] == array[2]
#       :equilateral
#     elsif array[0] == array[1] || array[1] == array[2] || array[0] == array[2]
#       :isosceles
#     else
#       :scalene
#     end
#   else
#     :invalid
#   end
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

# # Question 6

# # A triangle is classified as follows:

# # right One angle of the triangle is a right angle (90 degrees)
# # acute All 3 angles of the triangle are less than 90 degrees
# # obtuse One angle is greater than 90 degrees.
# # To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# # Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# # You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

# def triangle(angle_1, angle_2, angle_3)
#   array = [angle_1, angle_2, angle_3]
#   total = array.reduce(:+)
#   if array.min == 0 || total != 180
#     :invalid
#   elsif array.max == 90
#     :right
#   elsif array.max > 90
#     :obtuse
#   else
#     :acute
#   end
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

# # Question 7

# # Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# def friday_13th(year)
#   count = 0
#   12.times do |num|
#     time = Time.new(year,(num +1), 13)
#     if time.friday?
#       count += 1
#     end
#   end
#   count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# # Question 8

# # A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# # Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# def featured(number)
#   arr = []
#   (number..number * 10).each do |int|
#     if int.odd?
#       if int % 7 == 0 && int > number
#         arr << int
#       end
#     end
#     int += 1
#   end
#   arr.each do |num|
#     num_arr = num.to_s.chars
#     if num_arr.uniq.size == num_arr.size
#         return num
#     end
#     break if num >= 9_876_543_210
#   end
#   puts "There is no possible number that fulfills those requirements"
# end

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547

# Question 9

# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

# def bubble_sort!(array)
#   loop do
#     number = 0
#     final = 0
#     loop do
#       if array[number + 1] < array[number]
#         array[number], array[number + 1] = array[number +1], array[number]
#       end
#       number += 1
#       break if number + 1 == array.size
#     end
#     break if array[0] == array.min && array.last == array.max
#   end
#   p array
# end

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# # Question 10

# # Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# def sum_square_difference(num)
#   sum = 0
#   square = 0
#   1.upto(num) do |number|
#     sum += number
#     square += number**2
#   end
#   sum**2 - square
# end

# p sum_square_difference(3) == 22
# #   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150
