# Write a Ruby program to find the most occurring item in a given array. 

def most_occurring_item(arr)
  return nil if arr.empty?
  freq = arr.tally
  freq.max_by { |item, count| count }.first
end

puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
puts "Most occurring item: #{most_occurring_item(array)}"