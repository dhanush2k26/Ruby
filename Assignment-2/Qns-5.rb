# Question 5: Write a Ruby program to sum the values of an array.

puts "Enter numbers separated by spaces:"
input = gets.chomp
array = input.split.map(&:to_i)
puts "Sum: #{array.sum}"