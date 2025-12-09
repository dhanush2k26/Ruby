# Question 10: Write a Ruby program to reverse an array of integer values.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Original array: #{array}"
puts "Reversed array: #{array.reverse}"