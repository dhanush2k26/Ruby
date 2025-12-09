# Question 9: Write a Ruby program to insert an element (specific position) into an array.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Enter the position to insert:"
position = gets.chomp.to_i
puts "Enter the element to insert:"
element = gets.chomp.to_i
array.insert(position, element)
puts "Array after inserting #{element} at position #{position}: #{array}"