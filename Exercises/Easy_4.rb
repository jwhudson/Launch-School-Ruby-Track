# Question 1

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end


p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Question 2

def century(year)
  century = ((year/100) + 1)
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return "th" if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# Question 3

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0 && year % 400 == 0
      return true
    elsif year % 100 == 0
      return false
    else
      return true
    end
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# Question 4


def leap_year?(year)
  if year < 1752
    if year % 4 == 0
      return true
    end
  end
  if year % 4 == 0
    if year % 100 == 0 && year % 400 == 0
      return true
    elsif year % 100 == 0
      return false
    else
      return true
    end
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Question 5

def multisum(num)
  arr = (1..num).to_a.select { |number| number % 3 == 0 || number % 5 == 0 }
  arr.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Question 6

def running_total(arr)
  total = 0
  arr.map do |num|
    total += num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total([1,2,3,4,5])

# Question 7

def string_to_integer(string)
  conversion = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0}
  arr = string.chars.map { |char| conversion[char] }
  value = 0
  arr.each { |num| value = 10 * value + num }
  value
end

string_to_integer("12345")

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

def hexadecimal_to_integer(string)
    conversion = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0, "A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15 }
  arr = string.chars.map { |char| conversion[char.upcase] }
  value = 0
  arr.each do |num|
    value = value * 16 + num
  end
end

hexadecimal_to_integer('4D9f')

# Question 8

def string_to_signed_integer(string)
  conversion = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0, "-" => "-"}
  arr = string.chars.map { |char| conversion[char] }
  if arr[0].class != Integer
    sign = arr.shift
  end
  value = 0
  arr.each { |num| value = 10 * value + num }
  if sign == "-"
    value = value - (value * 2)
  end
  value
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Question 9

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(5015)
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Question 10

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  original = number
  result = ''
  loop do
    number, remainder = number.abs.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  if original < 0
    "-#{result}"
  elsif original > 0
    "+#{result}"
  else
    "0"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
