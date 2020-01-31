# Example 1

def select_fruit(produce)
  fruit = {}
  counter = 0
  produce_keys = produce.keys

  loop do
    break if counter == produce_keys.size

    current_produce = produce_keys[counter]
    produce_type = produce[current_produce]

    if produce_type == "Fruit"
      fruit[current_produce] = produce_type
    end

    counter += 1
  end
  fruit
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce)

# Example 2

def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end
  numbers
end

numbers = [1,2,3,4,5]

p double_numbers(numbers)
p numbers

# Example 3

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

p double_odd_numbers(numbers)

# Exmaple 4

def multiply(numbers, factor)
  counter = 0
  multiplied_array = []

  loop do
    break if counter == numbers.size

    multiplied_array << numbers[counter] * factor

    counter += 1
  end
  multiplied_array
end

p multiply(numbers, 3)
