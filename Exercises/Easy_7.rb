# Question 1

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(array_1, array_2)
  combined_arr = []
  total_elements = array_1.size * 2
  arr_1_counter = 0
  arr_2_counter = 0
  total_elements.times do |n|
    if n.even?
      combined_arr << array_1[arr_1_counter]
      arr_1_counter += 1
    else
      combined_arr << array_2[arr_2_counter]
      arr_2_counter += 1
    end
  end
  p combined_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Question 1 - Further Exploration

def interzip(array_1, array_2)
  array_1.zip(array_2).flatten
end

p interzip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Question 2

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

def letter_case_count(string)
  hash = {lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    if ("a".."z").include?(char)
      hash[:lowercase] += 1
    elsif ("A".."Z").include?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  p hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Question 3

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  words = string.split(" ")
  p words.map { |word| word.capitalize }.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Question 4

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  characters = string.chars
  characters.map! do |letter|
    if ("A".."Z").include?(letter)
      letter.downcase
    else
      letter.upcase
    end
  end
  characters.join("")
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Question 5

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(string)
  characters = string.chars
  count = 0
  loop do
    if count.even?
      characters[count].upcase!
      count += 1
    else
      characters[count].downcase!
      count += 1
    end
    break if count == characters.size
  end
  p characters.join("")
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Question 6

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(string)
  characters = string.chars
  upcase_char = false
  output = []
  characters.each do |char|
    if ("A".."Z").include?(char) || ("a".."z").include?(char)
      upcase_char = !upcase_char
    end
    if upcase_char
      output << char.upcase
    else
      output << char.downcase
    end
  end
  output.join("")
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Question 7

# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

def show_multiplicative_average(array)
  result = ((array.reduce(1.0, :*))/array.size).round(3)
  puts "The result is #{format('%0.3f', result)}"
end

show_multiplicative_average([3, 5])


show_multiplicative_average([6])


show_multiplicative_average([2, 5, 7, 11, 13, 17])

# Question 8

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

def multiply_list(arr_1, arr_2)
  output_arr = []
  arr_1.size.times do |num|
    output_arr << arr_1[num] * arr_2[num]
  end
  p output_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Question 9

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr_1, arr_2)
  output_arr = []
  arr_1.each do |num_1|
    arr_2.each do |num_2|
      output_arr << num_1 * num_2
    end
  end
  p output_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Question 10

# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  arr = string.split(" ")
  p arr[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Question 10 - Further Exploration

def middle(string)
  arr = string.split(" ")
  if arr.size < 2
    puts "Enter a string with at least 2 words"
    return
  end
  if arr.size.even?
    puts "#{arr[(arr.size/2) - 1]} #{arr[arr.size/2]}"
  else
    puts "#{arr[arr.size/2]}"
  end
end

middle("one")
middle('two words')
middle('Even words ')