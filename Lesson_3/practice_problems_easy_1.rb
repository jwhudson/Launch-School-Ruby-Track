# Question 1

numbers = [1,2,2,3]
numbers.uniq

puts numbers

# Question 2

#In Ruby '!' functions in the same way a NOT gate would. It reverses the operation state of it's operand, which means that if there is an experssion that outputs true, then using the '!' before it makes it false.
# '!' is also used as part of method names, it indicates that the method will mutate it's caller.
# '?' is used in method names to indicate when a method returns a boolean (true or false) value.
# != is an inequality checker, if one term does not equal another this will return true.
# !user_name means NOT user_name, turns an object into the opposite of it's boolean equivalent
# words.uniq!, the '!' indicates that the method uniq! will mutate it's called, this may not be the case though and is only a naming convention.
#? : is the ternary operator for if..else
#putting !! before something turns the object into it's boolean equivalent.

# Question 3

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.gsub!("important", "urgent")

# Question 4

numbers = [1,2,3,4,5]

numbers.delete(1)

numbers = [1,2,3,4,5]

numbers.delete_at(1)

# Question 5

(10..100).include?(42)

# Question 6

famous_words = "seven years ago..."

puts "Four score and #{famous_words}"
puts "Four score and " << famous_words

# Question 7

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

# Question 8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3,
                "BamBam" => 4, "Pebbles" => 5 }

arr = []
arr << flintstones.key(2)
arr << flintstones["Barney"]

p arr

#OR

flintstones.assoc("Barney")