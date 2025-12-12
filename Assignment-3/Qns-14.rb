# Question 14: Write a Ruby program to search for items that start with a specified string in a given array.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split
puts "Enter the prefix to search for:"
prefix = gets.chomp
matching_items = array.select { |item| item.start_with?(prefix) }
puts "Items starting with '#{prefix}': #{matching_items}"