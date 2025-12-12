# Question 15: Write a Ruby program to swap the first and last elements of a given array of integers, length will be at least 1. Return the modified array.

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Given array: #{array}"
if array.length >= 1
  array[0], array[-1] = array[-1], array[0]
end
puts "Modified array: #{array}"