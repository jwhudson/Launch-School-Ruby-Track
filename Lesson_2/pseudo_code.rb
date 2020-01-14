#A Method that returns the sum of two integers
#------------------------------------------------------------#
#Pseudo-code

#Takes two integers from the user
#Saves the first value as integer 1
#Saves the second value as integer 2
#Adds the integers together
#Returns the value of the addition

#-------------------------------------------------------------#

#Formal Pseudo-code

#START
#GET user input to number 1
#SET number_1 = get
#GET user input to number 2
#SET number_2 = get

#READ number_1 and number_2 and add these together
#PRINT result of addition


#----------------------------------------------------------------#

#With Ruby Syntax

puts "Which numbers would you like to add?"
puts "Number 1:"
number_1 = gets.chomp

puts "Number 2:"
number_2 = gets.chomp

puts "#{number_1} + #{number_2} is equal to #{ number_1.to_i + number_2.to_i}"

#--------------------------------------------------------------------#
#A Method that takes an array of strings, and returns a string that is all those strings concatenated together


#--------------------------------------------------------------------#

#Pseudo-Code
#--------------------------------------------------------------------#
#Takes three words from the user
#Saves each word to a variable
#Saves an empty array to a variable
#Pushes each word to the array in order
#Run the join(" ") method on the saved array to mututate it with concatonated strings
#Returns the new array

#--------------------------------------------------------------------#
#Formal Pseudo-code
#--------------------------------------------------------------------#

#START
#GET user to input word 1
#Set word_1 = get
#GET user to input word 2
#Set word_2 = get
#GET user to input word 3
#Set word_3 = get
#SET arr to an empty variable
#Push each word to array
#READ new array
#PRINT Array

#--------------------------------------------------------------------#
#With Ruby Syntax
#--------------------------------------------------------------------#

puts "Please enter the first word"
word_1 = gets.chomp

puts "Please enter the second word"
word_2 = gets.chomp

puts "Please enter the third word"
word_3 = gets.chomp

arr = []

arr.push(word_1)
arr.push(word_2)
arr.push(word_3)

puts arr.join(" ")

