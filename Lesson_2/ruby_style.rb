# Ruby style rules:

# The text editor's tab function should be set to use 2 spaces.
# The "#" at the beginning of a line indicates a comment. Comments are used by programmers to leave notes for other programmers or themselves at a later point in time.

# When you initialize or define a method, variable, or file you should always use snake_case formatting. snake_case formatting is created using all lower case letters and seperating words with an underscore character.

#Naming a file

this_is_a_snake_case_file.rb

#Assigning a variable

forty_two = 42

#Defining a method

def this_is_a_great_method
  #do stuff
end

#When you want to represent a value that will not change in your Ruby program, you define a constand variable, often referred to as a constant. In Ruby all constants are denoted with uppercase letters.

FOUR = "four"
FIVE = "five"

# When working with do..end blocks, prefer {} when the entire code expression fits onto one line

#Multi-line vs single line

[1,2,3].each do |i|
  #do stuff
end

[1,2,3].each { |i| #do stuff }

# When naming classes you should use CamelCase formatting. CamelCase uses no spaces and capitalizes every word.

#Class naming

class MyFirstclass
end

class MySecondClass
end

