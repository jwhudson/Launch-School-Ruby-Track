# Easy 1

# Question 1

def repeat(string, num)
  num.times do
    puts string
  end
end

repeat("Hello!", 2)

# Question 2

def is_odd?(num)
  num % 2 == 1
end

p is_odd?(3)

# Question 3

def digit_list(number)
  number.to_s.split("").map { |num| num.to_i }
end

p digit_list(12345)

# Question 4

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'Car', 'truck'
]

def count_occurances(vehicles)
  counter = {}
  vehicles.each do |vehicle|
    if counter.key?(vehicle.downcase)
      counter[vehicle.downcase] += 1
    else counter[vehicle.downcase] = 1
    end
  end
  counter.each do |key,value|
    puts "#{key} => #{value}"
  end
end

count_occurances(vehicles)

# Question 5

def reverse_sentence(string)
  string.split.reverse.join(" ")
end

p reverse_sentence("Hi how are you?")

# Question 6

def reverse_words(string)
  arr = string.split.map do |word|
    if word.length >= 5
      word.split("").reverse.join("")
    else
      word
    end
  end
  arr.join(" ")
end

p reverse_words("Walk around the block")

# Question 7

def stringy(num)
  indicator = 0
  string = ""
  num.times do
    if indicator == 0
      string = string + "1"
      indicator = 1
    else
      string = string + "0"
      indicator = 0
    end
  end
  string
end

stringy(10)

# Question 8

def average(array)
  total = 0.0
  array.each do |num|
    total += num
  end
  total / array.size
end

p average([1,2,3,4,5,6,7])

# Question 9

def sum(num)
  total = 0
  arr = num.to_s.split("")
  arr.each do |number|
    total += number.to_i
  end
  total
end

puts sum(123456)

# Question 10

def calculate_bonus(integer, boolean)
  boolean ? integer / 2 : 0
end

p calculate_bonus(5000, true)