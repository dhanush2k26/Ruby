puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Enter the element to find index:"
element = gets.chomp.to_i
puts "Index of #{element}: #{array.index(element)}"