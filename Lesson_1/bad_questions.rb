# NUMBERS = [1, 2, 3]
# arr = [1, 2, 3]

# def test
# puts NUMBERS.inspect
# puts arr.inspect
# end

# test



def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lengths("To be or not to be")