# Question 8: Write a Ruby program to remove a specific element from an array.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Enter the element to remove:"
element = gets.chomp.to_i
array.delete(element)
puts "Array after removing #{element}: #{array}"