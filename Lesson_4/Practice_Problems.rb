# Question 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
flintstones.each do |person|
  hash[person] = flintstones.index(person)
end

# Question 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = 0

ages.each_value { |age| total_age += age }

p total_age

# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |key, age| age < 100 }

p ages

# Question 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
youngest = 1000
ages.each_value do |value|
  youngest = value if value < youngest
end

# Question 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index  = flintstones.index { |name| name[0,2] == "Be" }
p index

# Question 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name = name[0,3] }

# Question 7

statement = "The Flintstones Rock"

letter_count = {}

statement.each_char do |letter|
  if letter_count.has_key?(letter)
    letter_count[letter] += 1
  else
    letter_count[letter] = 1
  end
end

p letter_count

# Question 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Question 9

words = "the flintstones rock"

def titelize(phrase)
  arr = phrase.split(" ")

  arr.map! { |word| word.capitalize }

  arr.join(" ")
end

p titelize(words)

# Question 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person, value|
    if value["age"] > 64
      value["age_group"] = "senior"
    elsif value["age"] > 17
      value["age_group"] = "adult"
    else
      value["age_group"] = "kid"
    end
end

p munsters