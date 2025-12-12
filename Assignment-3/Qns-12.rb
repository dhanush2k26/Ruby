puts "Enter array elements separated by spaces:"
array = gets.chomp.split.map(&:to_i)
hash_index=array.each_with_index.to_h

puts hash_index
