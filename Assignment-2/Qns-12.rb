print "Enter element in array with space sepearted:"
n=gets.chomp.split.map(&:to_i)
sorted_array=n.sort
puts "The sorted Array is #{sorted_array}"
puts "The Second Largest elements is #{sorted_array[-2]}"