#Write a Ruby program to check whether all items are identical in a given array. 

def all_identical?(arr)
  arr.uniq.length <= 1
end

puts "Enter array elements (numbers) separated by spaces:"
input_array = gets.chomp.split.map(&:to_i)

puts "\n--- Result ---"
if all_identical?(input_array)
  puts "The array #{input_array} is identical."
else
  puts "The array #{input_array} is NOT identical."
end