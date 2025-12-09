# Question 6: Write a Ruby program to test if an array contains a specific value.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Enter the value to check:"
value = gets.chomp.to_i
puts "Array contains #{value}: #{array.include?(value)}"