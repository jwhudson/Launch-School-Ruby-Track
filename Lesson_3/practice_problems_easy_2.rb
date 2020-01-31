# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")

# Question 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")
p advice.match?("Dino")

# Question 5

p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6

flintstones << "Dino"

# Question 7

flintstones.pop
p flintstones.push("Dino", "Hoppy")

# Question 8

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice(0, advice.index("house"))

# Question 9

statement = "The Flintstones Rock!"

p statement.count("t")

# Question 10

title = "Flintstone Family Members"

p title.center(40)