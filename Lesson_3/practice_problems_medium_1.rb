# Question 1

statement = "The Flintstones Rock!"

10.times do
  puts statement = statement.split("").unshift(" ").join("")
end

# Question 2

# puts "the value of 40 + 2 is " + (40 + 2)

#The above throws an error due to the final (40 + 2) being outwith the quotation marks. This causes an integer to be concatenated into a string which will throw an error. Converting 42 to a string before concatenation would fix this error, or moving the (40 + 2) inside the quotation marks and using string interpolation to do the sum.

# Question 3

def factors(number)
  divisor = number
  factors = []
  if divisor >= 1
    begin
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end until divisor == 0
  end
  factors
end

# Question 4

#Array + Array produces a new array which is a concatenation of the two previous ones.
#Array << joins a second array to the first one, this doesn't return a new array it mutates the first one.

# Question 5

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# Question 7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Question 8

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# Question 9

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)