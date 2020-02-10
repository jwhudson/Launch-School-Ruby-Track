# Example 1

[[1,2],[3,4]].each do |arr|
  puts arr.first
end

# Example 2

[[1,2], [3,4]].map do |arr|
  puts arr.first
end

#Example 3

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Example 4

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# Example 5

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# Example 6

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end

# Example 7

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end

